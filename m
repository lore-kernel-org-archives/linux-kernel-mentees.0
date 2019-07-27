From: pebolle at tiscali.nl (Paul Bolle)
Date: Sat, 27 Jul 2019 11:36:08 +0200
Subject: [Linux-kernel-mentees] [PATCH] isdn/gigaset: check endpoint
	null in gigaset_probe
In-Reply-To: <24cd0b70-45e6-ea98-fc8f-b25fbf6e817f@gmail.com>
References: <20190726133528.11063-1-tranmanphong@gmail.com>
	<1876196a0e7fc665f0f50d5e9c0e2641f713e089.camel@tiscali.nl>
	<24cd0b70-45e6-ea98-fc8f-b25fbf6e817f@gmail.com>
Message-ID: <fcb8a79e4dab34511e4d7b379afff4736a8aa401.camel@tiscali.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Phong,

Phong Tran schreef op za 27-07-2019 om 08:56 [+0700]:
> On 7/26/19 9:22 PM, Paul Bolle wrote:
> > Phong Tran schreef op vr 26-07-2019 om 20:35 [+0700]:
> > > diff --git a/drivers/isdn/gigaset/usb-gigaset.c b/drivers/isdn/gigaset/usb-gigaset.c
> > > index 1b9b43659bdf..2e011f3db59e 100644
> > > --- a/drivers/isdn/gigaset/usb-gigaset.c
> > > +++ b/drivers/isdn/gigaset/usb-gigaset.c
> > > @@ -703,6 +703,10 @@ static int gigaset_probe(struct usb_interface *interface,
> > >   	usb_set_intfdata(interface, cs);
> > >   
> > >   	endpoint = &hostif->endpoint[0].desc;
> > > +        if (!endpoint) {
> > > +		dev_err(cs->dev, "Couldn't get control endpoint\n");
> > > +		return -ENODEV;
> > > +	}
> > 
> > When can this happen? Is this one of those bugs that one can only trigger with
> > a specially crafted (evil) usb device?
> > 
> 
> Yes, in my understanding, this only happens with random test of syzbot.

Looking at this again, I note the code is taking the address of a struct
usb_endpoint_descriptor that's stored somewhere in memory. That address can't
be NULL, can it?

So I haven't even looked at the fuzzer's report here, but I don't see how this
patch could help. It only adds dead code. Am I missing something and should I
drink even more coffee this Saturday morning?

> > >   	buffer_size = le16_to_cpu(endpoint->wMaxPacketSize);
> > >   	ucs->bulk_out_size = buffer_size;
> > > @@ -722,6 +726,11 @@ static int gigaset_probe(struct usb_interface *interface,
> > > 
> > Please note that I'm very close to getting cut off from the ISDN network, so
> > the chances of being able to testi this on a live system are getting small.
> > 
> 
> This bug can be invalid now. Do you agree?

It's just that your patch arrived while I was busy doing my last ever test of
the gigaset driver. So please don't expect me to put much time in this report
(see 
https://lwn.net/ml/linux-kernel/20190726220541.28783-1-pebolle%40tiscali.nl/
).

Thanks,


Paul Bolle
