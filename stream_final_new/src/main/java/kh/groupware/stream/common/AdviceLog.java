package kh.groupware.stream.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);

	@Pointcut("execution(public * kh.groupware.stream..*Dao.*(..))")
	public void daoPointCut() {
	}
	// .. 왜들어가는지 여쭤보기

	@Pointcut("execution(public * kh.groupware.stream..*ServiceImpl.*(..))")
	public void servicePointCut() {
	}

	@Pointcut("execution(public * kh.groupware.stream..*Controller.*(..))")
	public void controllerPointCut() {
	}

	@Around("daoPointCut()")
	public Object aroundDaoLog(ProceedingJoinPoint dpjp) throws Throwable {
		logger.debug("▷[" + dpjp.getThis() + ":" + dpjp.getSignature().getName() + "]");

		Object[] args = dpjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			logger.debug("▷-args[" + i + "]" + args[i] + "");
		}
		Object dobj = null;
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		dobj = dpjp.proceed();
		stopwatch.stop();
		logger.debug("▷[Dao ▷ " + stopwatch.getTotalTimeMillis() + "ms]" + dobj);
		return dobj;
	}

	@Around("servicePointCut()")
	public Object aroundSrvLog(ProceedingJoinPoint spjp) throws Throwable{
		logger.debug("▷▷["+spjp.getThis()+":"+spjp.getSignature().getName()+"]");
		
		Object[] args = spjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("▷▷-args["+i+"] "+args[i]+"");
		}
		Object sobj = null;
		sobj = spjp.proceed();
		logger.debug("▷▷[Srv ▷]"+sobj);
		return sobj;
		}

	@Around("controllerPointCut()")
	public Object aroundCtrLog(ProceedingJoinPoint cpjp) throws Throwable {
		Object cobj = null;

		logger.debug("▷▷▷[" + cpjp.getThis()+":"+cpjp.getSignature().getName() + "]");

		Object[] args = cpjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			logger.debug("▷▷▷-args[" + i + "]" + args[i] + "");
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		cobj = cpjp.proceed();
		stopwatch.stop();
		logger.debug("▷▷▷[Ctr ▷" + stopwatch.getTotalTimeMillis() + "ms]" + cobj);
		return cobj;
	}
}
