From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 8 May 2019 23:35:41 -0600
Subject: [Linux-kernel-mentees] [PATCH] lspci: Make output for empty
 range behind a bridge consistent
In-Reply-To: <20190508134036.GA220289@google.com>
References: <20190508052118.21796-1-skunberg.kelsey@gmail.com>
	<20190508134036.GA220289@google.com>
Message-ID: <20190509053540.GA29343@asus>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, May 08, 2019 at 08:40:36AM -0500, Bjorn Helgaas wrote:
Hi Bjorn, 

> Hi Kelsey,
> 
> On Tue, May 07, 2019 at 11:21:18PM -0600, Kelsey Skunberg wrote:
> > When a range behind a bridge is empty, '[empty]' will be displayed
> > after the prefix. Removing option to display 'None' for consistency.
> 
> 1) I don't think Martin enforces this for pciutils, but for the kernel
> we prefer to use imperative mood in the commit log as you did in the
> subject, e.g., say "Remove" instead of "Removing".
> 
> 2) The commit log doesn't quite make it clear what the purpose of this
> is.  I *think* it's so that "lspci -vv" and "lspci -vvv" both use the
> same text to describe a disabled window.  Saying that explicitly,
> along with sample output, would help, e.g., the current output is:
> 
>   Memory behind bridge: None                          # lspci -vv
>   Memory behind bridge: 00200000-001fffff [empty]     # lspci -vvv
> 
> and you're changing it so both -vv and -vvv use "[empty]":
> 
>   Memory behind bridge: [empty]                       # lspci -vv
>   Memory behind bridge: 00200000-001fffff [empty]     # lspci -vvv
>

These are great notes. I'll make sure to maintain the imperative mood
and provide more details in commit logs. I'll update the commit log
accordingly in V2.

> Personally I think that if we make them both the same, using "[None]"
> instead of "[empty]" would read better, at least for -vv.
> 
> But "[empty]" does make good sense for the -vvv case, so maybe the
> existing code is better even with the inconsistency.  I guess that's
> up to Martin.
>

I went through this same thought. I agree I like the 'None' for -v/-vv,
though the '[Empty]' suites better when following the range. I debated
for a while on which route to go here. 'None' didn't seem to fit after
the ranges, which is why '[Empty]' was used for all verbose options
instead. 

If you and Martin also prefer the existing output despite the inconsistency,
I can submit a patch to instead only remove the dead code (the !verbose check)
and simplify some of the code. 

> > Using -vvv will include full range addresses between prefix and '[empty]'.
> > 
> > show_range() is only called when verbose (-v). Code checking for
> > 'not verbose' is not needed.
> 
> Nice simplification!  I would split this into a separate patch because
> it's not logically related to changing the text and it will make both
> patches easier to read.  Also, it would make it easy for Martin to
> choose whether he wants to apply one, both, or neither.
>

In the event the two patches would cause a merge conflict if both
applied, is it still proper to submit them both? I can place the
'!verbose' check back into this patch, though there would still be
some changes to make it fit the new structure. 

> If/when you repost, be sure to add "[PATCH v2]" in the subject and,
> since there's more than one patch, ideally, add a "[PATCH v2 0/n]"
> cover letter, with each patch as a response to the cover letter.  That
> helps keep them all together.
> 
> > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > ---
> >  lspci.c | 22 +++++++---------------
> >  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> Pay close attention to the diff.  In this case you accidentally added
> a whitespace error (space at end of line).  Other ones to avoid are
> space followed by tab and blank lines at end of file.  Some projects
> avoid tabs completely (using spaces instead); you just have to notice
> the previous practice in the file and follow that.
>

Ah! I was so focused on the leading whitespace I didn't check the trailing!
I'll keep closer attention to this. Thank you! 

> > diff --git a/lspci.c b/lspci.c
> > index d63b6d0..65cbde9 100644
> > --- a/lspci.c
> > +++ b/lspci.c
> > @@ -375,23 +375,15 @@ show_size(u64 x)
> >  
> >  static void
> >  show_range(char *prefix, u64 base, u64 limit, int is_64bit)
> > -{
> 
> Here's the spurious whitespace change.
> 
> > -  if (base > limit)
> > +{ 
> > +  printf("%s:", prefix);
> > +  if (base <= limit || verbose > 2)
> 
> I like how your new code only uses "base <= limit" instead of how the
> previous code used both "base <= limit" and "base > limit".  They're
> basically testing for the same thing, so it was a small mental burden
> to have to recognize them as related.
> 
> >      {
> > -      if (!verbose)
> > -	return;
> > -      else if (verbose < 3)
> > -	{
> > -	  printf("%s: None\n", prefix);
> > -	  return;
> > -	}
> > +      if (is_64bit)
> > +        printf(" %016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
> > +      else
> > +        printf(" %08x-%08x", (unsigned) base, (unsigned) limit);
> >      }
> > -
> > -  printf("%s: ", prefix);
> > -  if (is_64bit)
> > -    printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
> > -  else
> > -    printf("%08x-%08x", (unsigned) base, (unsigned) limit);
> >    if (base <= limit)
> >      show_size(limit - base + 1);
> >    else
> > -- 
> > 2.20.1
> > 

Thank you for the in-depth feedback! I appreciate it a lot! 

-Kelsey 
