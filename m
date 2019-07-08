From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Mon, 8 Jul 2019 18:02:05 +0300
Subject: [Linux-kernel-mentees] [PATCH] cs5535: use BIT() macro for
	defining bit-flags
In-Reply-To: <20190708085735.GA12241@arch>
References: <20190707113016.GA30635@arch>
	<CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
	<20190708085735.GA12241@arch>
Message-ID:
 <CAHp75VeDNeH1VzOvB3H5nrgint32BY9cGCNdE_pZZYT861ZrCQ@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708150205.NpczGhOFRcfp2fuHlbSjsNrPgnhcQPedJ6QBib3bn48@z>

On Mon, Jul 8, 2019 at 11:57 AM Amol Surati <suratiamol at gmail.com> wrote:
>
> On Mon, Jul 08, 2019 at 11:02:29AM +0300, Andy Shevchenko wrote:
> > On Sun, Jul 7, 2019 at 2:30 PM Amol Surati <suratiamol at gmail.com> wrote:
> > >
> > > The BIT() macro is available for defining the required bit-flags.
> >
> > Shouldn't bits.h be added?
> >
> > > Since it operates on an unsigned value and expands to an unsigned result,
> > > using it, instead of an expression like (1 << x), also fixes the problem
> > > of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
> > > CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).
> >
> > What problem?
> > You need to describe that (UB by the standard, though gcc works fine,
> > I never heard it utilizes such).
>
> Yes. I will send a new version. I also missed including
> <linux/bitops.h>, although the compilation with the default
> configuration of my distro still succeeds without it, by chance.
>
It's now in a separate bits.h. No need to include complete bitops.h.

> Thank you,
> -amol
>
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
