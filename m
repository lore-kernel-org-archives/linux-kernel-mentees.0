From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 16 May 2019 15:26:16 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] lspci: Remove unnecessary
 !verbose check in show_range()
In-Reply-To: <CABhMZUWviq7O7f3eaDk45JKYUz+Gg_4TdtTkx3HC5WgLWh5Umg@mail.gmail.com>
References: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
	<20190511230310.4438-3-skunberg.kelsey@gmail.com>
	<CABhMZUWviq7O7f3eaDk45JKYUz+Gg_4TdtTkx3HC5WgLWh5Umg@mail.gmail.com>
Message-ID: <20190516212615.GA4369@asus>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Thu, May 16, 2019 at 07:58:37AM -0500, Bjorn Helgaas wrote:
> On Sat, May 11, 2019 at 6:05 PM Kelsey Skunberg
> <skunberg.kelsey at gmail.com> wrote:
> >
> > Remove 'if (!verbose)' code in show_range() due to not being called.
> > show_range() will only be called when verbose is true. Additional call
> > to check for verbosity within show_range() is dead code.
> >
> > !verbose was used so nothing would print if the range behind a bridge
> > had a base > limit and verbose == false. Since show_range() will not be
> > called when verbose == false, not printing bridge information is
> > still accomplished.
> >
> > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > ---
> >  lspci.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/lspci.c b/lspci.c
> > index 937c6e4..419f386 100644
> > --- a/lspci.c
> > +++ b/lspci.c
> > @@ -376,17 +376,11 @@ show_size(u64 x)
> >  static void
> >  show_range(char *prefix, u64 base, u64 limit, int is_64bit)
> >  {
> > -  if (base > limit)
> > +  if (base > limit || verbose < 3)
> >      {
> > -      if (!verbose)
> > -       return;
> > -      else if (verbose < 3)
> > -       {
> > -         printf("%s: None\n", prefix);
> > -         return;
> > -       }
> 
> I don't think this works quite right.  The resulting code is:
> 
>   if (base > limit || verbose < 3) {
>     printf("%s: None\n", prefix);
>     return;
>   }
> 
> but that means we print "None" when the window is *enabled* (base <=
> limit) and verbose < 3.  We should print the window in that case.
> 
> > +      printf("%s: None\n", prefix);
> > +      return;
> >      }
> > -
> >    printf("%s: ", prefix);
> >    if (is_64bit)
> >      printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
> > --
> > 2.20.1
> >

You're absolutely right and I should have caught this. Revised and v3
sumbitted. Thank you for reviewing and letting me know.
