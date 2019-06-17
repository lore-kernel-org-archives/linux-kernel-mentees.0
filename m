From: bjorn.helgaas at gmail.com (Bjorn Helgaas)
Date: Mon, 17 Jun 2019 17:56:11 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] lspci: Replace output for
 bridge with empty range from 'None' to '[empty]'
In-Reply-To: <20190617222909.GB24924@JATN>
References: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
	<20190516212327.4310-1-skunberg.kelsey@gmail.com>
	<20190516212327.4310-4-skunberg.kelsey@gmail.com>
	<CABhMZUUSBFr4-_B-VPpU6z-xKHy1nxOg_TS=MUuBspyFWCptUQ@mail.gmail.com>
	<20190617222909.GB24924@JATN>
Message-ID: <CABhMZUVkHp_9cW=i7DRqEgASenn-ZW0-CEA9TBQqMNcL3kmmWw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jun 17, 2019 at 5:29 PM Kelsey Skunberg
<skunberg.kelsey at gmail.com> wrote:
> On Tue, Jun 11, 2019 at 03:25:00PM -0500, Bjorn Helgaas wrote:
> > On Thu, May 16, 2019 at 4:23 PM Kelsey Skunberg
> > <skunberg.kelsey at gmail.com> wrote:
> > >
> > > Change output displayed for memory behind bridge when the range is
> > > empty to be consistent between each verbosity level. Replace 'None' with
> > > '[empty]'. Old and new output examples listed below for each verbosity
> > > level.
> > >
> > > Show_range() is not called unless verbose == true. No output given
> > > unless a verbose argument is provided.
> > >
> > > OLD ouptut for -v and -vv which uses 'None' and -vvv uses '[empty]':
> >
> > s/ouptut/output/
> >
> > >   Memory behind bridge: None                          # lspci -v
> > >   Memory behind bridge: None                          # lspci -vv
> > >   Memory behind bridge: 0000e000-0000efff [empty]     # lspci -vvv
> > >
> > > NEW output for -v and -vv to also use "[empty]":
> > >
> > >   Memory behind bridge: [empty]                       # lspci -v
> > >   Memory behind bridge: [empty]                       # lspci -vv
> > >   Memory behind bridge: 0000e000-0000efff [empty]     # lspci -vvv
> >
> > How about this alternative?  The spec doesn't actually use the term
> > "window", but I think in terms of bridge windows to downstream
> > devices, and the windows can be either enabled or disabled.
> >
> >   Memory behind bridge: Disabled    # lspci -v or lspci -vv
> >   Memory behind bridge: Disabled [0x0000e000-0x0000efff]   # lspci -vvv
> >
>
> I like the alternative of using "Disabled". Could it be more suiting to use
> "[disabled]" which is also used in show_bases(), show_rom(), and show_htype2()?
> Then keep the range format the same. For example:
>
>    Memory behind bridge: [disabled]    # lspci -v or lspci -vv
>    Memory behind bridge: 0x0000e000-0x0000efff [disabled]   # lspci -vvv

I like it, and I like your attention to detail in matching other parts
of lspci output.

> > > Advantage is consistent output regardless of verbosity level chosen and
> > > to simplify the code.
> > >
> > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > > ---
> > >  lspci.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/lspci.c b/lspci.c
> > > index 7418b07..0c00c91 100644
> > > --- a/lspci.c
> > > +++ b/lspci.c
> > > @@ -376,16 +376,14 @@ show_size(u64 x)
> > >  static void
> > >  show_range(char *prefix, u64 base, u64 limit, int is_64bit)
> > >  {
> > > -  if (base > limit && verbose < 3)
> > > +  printf("%s:", prefix);
> > > +  if (base <= limit || verbose > 2)
> > >      {
> > > -      printf("%s: None\n", prefix);
> > > -      return;
> > > +      if (is_64bit)
> > > +        printf(" %016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
> > > +      else
> > > +        printf(" %08x-%08x", (unsigned) base, (unsigned) limit);
> > >      }
> > > -  printf("%s: ", prefix);
> > > -  if (is_64bit)
> > > -    printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
> > > -  else
> > > -    printf("%08x-%08x", (unsigned) base, (unsigned) limit);
> > >    if (base <= limit)
> > >      show_size(limit - base + 1);
> > >    else
> > > --
> > > 2.20.1
> > >
