'use client';
import { motion } from 'framer-motion';
import Image from 'next/image';

const Hero = () => {
  return (
    <section className="relative w-full h-screen mx-auto">
      <div className="sm:px-16 px-6 absolute inset-0 top-[120px] max-w-7xl mx-auto flex flex-row items-start gap-5">
        <div className="flex flex-col justify-center items-center mt-5">
          <div className="w-5 h-5 rounded-full bg-primary" />
          <div className="w-1 sm:h-80 h-40 hero-gradient" />
        </div>

        <div>
          <h1 className="font-black text-white lg:text-[80px] sm:text-[60px] xs:text-[50px] text-[40px] lg:leading-[98px] mt-2">
            Hi, I'm <span className="text-primary">Your Name</span>
          </h1>
          <p className="text-dimWhite font-medium lg:text-[30px] sm:text-[26px] xs:text-[20px] text-[16px] lg:leading-[40px] mt-2">
            Full Stack Developer & <br className="sm:block hidden" />
            UI/UX Designer
          </p>
        </div>
      </div>

      <motion.div
        animate={{
          y: [0, 24, 0],
        }}
        transition={{
          duration: 1.5,
          repeat: Infinity,
          repeatType: 'loop',
        }}
        className="absolute xs:bottom-10 bottom-32 w-full flex justify-center items-center"
      >
        <a href="#about">
          <div className="w-[35px] h-[64px] rounded-3xl border-4 border-primary flex justify-center items-start p-2">
            <motion.div
              animate={{
                y: [0, 24, 0],
              }}
              transition={{
                duration: 1.5,
                repeat: Infinity,
                repeatType: 'loop',
              }}
              className="w-3 h-3 rounded-full bg-primary mb-1"
            />
          </div>
        </a>
      </motion.div>
    </section>
  );
};

export default Hero;
