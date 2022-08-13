import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Do not share',
    Svg: require('@site/static/img/ideogram.svg').default,
    description: (
      <>
        By invitation only. Docs site is publicly listed, but we do not want it posted anywhere.
      </>
    ),
  },
  {
    title: 'Funded',
    Svg: require('@site/static/img/ideogram.svg').default,
    description: (
      <>
        Food, flights, airbnb covered by the Long Term Future Fund
      </>
    ),
  },
  {
    title: 'Please submit your session by October 1st',
    Svg: require('@site/static/img/ideogram.svg').default,
    description: (
      <>
        We'd like the schedule to cool down around the first week of october, subject to changes and exceptions.
      </>
    ),
  },
  {
    title: 'Discord for updates',
    Svg: require('@site/static/img/ideogram.svg').default,
    description: (
      <>
        You should have received an invite link to the discord. It is the main communication channel for the workshop, please join it.
      </>
    ),
  },
  {
    title: 'Google calendar for schedule',
    Svg: require('@site/static/img/ideogram.svg').default,
    description: (
      <>
        You can find a link in the discord.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
