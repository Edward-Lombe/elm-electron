// Generated by typings
// Source: https://raw.githubusercontent.com/types/npm-ms/f40c81c7f45bc35e970de851117c29fc959220b2/index.d.ts
declare module 'ms' {
function ms (value: string): number;
function ms (value: number, options?: ms.Options): string;

module ms {
  export interface Options {
    long: boolean;
  }
}

export = ms;
}