From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 4 Sep 2019 22:11:12 -0600
Subject: [Linux-kernel-mentees] [PATCH 1/3] ACPI: Remove
	acpi_has_method() call from acpi_adxl.c
In-Reply-To: <CAJZ5v0iF=TxxD_gCJfaZzORTrcu+2StJE1_vhthB70jxqCkHuw@mail.gmail.com>
References: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
	<20190722023530.67676-2-skunberg.kelsey@gmail.com>
	<CAJZ5v0gRzu0bVL+7L9NhbWu5OxveEP8H8v5qpiW-FeOtoOepiw@mail.gmail.com>
	<20190722182929.GA203187@google.com>
	<CAJZ5v0iF=TxxD_gCJfaZzORTrcu+2StJE1_vhthB70jxqCkHuw@mail.gmail.com>
Message-ID: <20190905041112.GB117297@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190905041112.NLGZHl7YigjZqA3o9ohahLjCjgrQgNIkAkWkAmBTSTY@z>

On Mon, Sep 02, 2019 at 11:08:08PM +0200, Rafael J. Wysocki wrote:
> Sorry for the delayed reply.
> 
> On Mon, Jul 22, 2019 at 8:29 PM Bjorn Helgaas <helgaas at kernel.org> wrote:
> >
> > [+cc Tony (original author), Borislav (merged original patch)]
> >
> > On Mon, Jul 22, 2019 at 10:31:11AM +0200, Rafael J. Wysocki wrote:
> > > On Mon, Jul 22, 2019 at 4:36 AM Kelsey Skunberg
> > > <skunberg.kelsey at gmail.com> wrote:
> > > >
> > > > acpi_check_dsm() will already return an error if the DSM method does not
> > > > exist. Checking if the DSM method exists before the acpi_check_dsm() call
> > > > is not needed. Remove acpi_has_method() call to avoid additional work.
> > > >
> > > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > > > ---
> > > >  drivers/acpi/acpi_adxl.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > >
> > > > diff --git a/drivers/acpi/acpi_adxl.c b/drivers/acpi/acpi_adxl.c
> > > > index 13c8f7b50c46..89aac15663fd 100644
> > > > --- a/drivers/acpi/acpi_adxl.c
> > > > +++ b/drivers/acpi/acpi_adxl.c
> > > > @@ -148,11 +148,6 @@ static int __init adxl_init(void)
> > > >                 return -ENODEV;
> > > >         }
> > > >
> > > > -       if (!acpi_has_method(handle, "_DSM")) {
> > > > -               pr_info("No DSM method\n");
> > >
> > > And why is printing the message not useful?
> > >
> > > > -               return -ENODEV;
> > > > -       }
> > > > -
> > > >         if (!acpi_check_dsm(handle, &adxl_guid, ADXL_REVISION,
> > > >                             ADXL_IDX_GET_ADDR_PARAMS |
> > > >                             ADXL_IDX_FORWARD_TRANSLATE)) {
> >
> > The next line of context (not included in the patch):
> >
> >                pr_info("DSM method does not support forward translate\n");
> >
> > IMHO kernel messages that are just a constant string, with no context
> > or variable part (device ID, path, error code, etc) are questionable
> > in general.  Is there any dev_printk()-like thing that takes an
> > acpi_handle?  Seems like that would be useful for cases like this.
> >
> > This message *does* include an "ADXL: " prefix (from the pr_fmt
> > definition), and from reading the code you can see that the only
> > possible method is "\_SB.ADXL._DSM".
> >
> > There's nothing an end user can do with these messages, so I suspect
> > their value is for debugging during platform bringup, and it would be
> > sufficient to drop the first one (as Kelsey's patch does) and change
> > the second one like this:
> >
> > -              pr_info("DSM method does not support forward translate\n");
> > +              pr_info("%s DSM missing or does not support forward translate\n",
> > +                      path);
> 
> You have a point, but then I would expect the changelog to mention that.
> 
> As it stands, the patch does more than the changelog says, which isn't nice.

You're right, the changelog should include this information. I'll get an
updated version made. Thank you for getting back.

-Kelsey
