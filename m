Return-Path: <SRS0=oxYf=GL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D243C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 10:06:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7A4235FA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7A4235FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE5FB875A7;
	Fri,  8 Jan 2021 10:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5SUCuS1yNqs; Fri,  8 Jan 2021 10:06:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33CB3875A5;
	Fri,  8 Jan 2021 10:06:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17400C0891;
	Fri,  8 Jan 2021 10:06:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBCC5C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 10:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BEDF6875A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 10:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEnqXs9ZqRiL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 10:05:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5143287560
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 10:05:57 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-164-B6UsFJH8P-uef6L30UKDVQ-1; Fri, 08 Jan 2021 10:05:53 +0000
X-MC-Unique: B6UsFJH8P-uef6L30UKDVQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 8 Jan 2021 10:05:52 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 8 Jan 2021 10:05:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, Kees Cook <keescook@chromium.org>
Thread-Topic: deprecated.rst: deprecated strcpy ? (was: [PATCH] checkpatch:
 add a new check for strcpy/strlcpy uses)
Thread-Index: AQHW5Vix10kkBz1uN0KCdEjPICQLQ6odf7Ew
Date: Fri, 8 Jan 2021 10:05:52 +0000
Message-ID: <05733c9670a14463bec36b2cf0eeeede@AcuMS.aculab.com>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
 <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
 <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
 <202101071310.3AC5F0C4@keescook>
 <9e111f0f673ae6ced12efc01d32eefe8402c7f72.camel@perches.com>
In-Reply-To: <9e111f0f673ae6ced12efc01d32eefe8402c7f72.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] deprecated.rst: deprecated strcpy ?
 (was: [PATCH] checkpatch: add a new check for strcpy/strlcpy uses)
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Joe Perches
> Sent: 08 January 2021 00:52
...
> > The original goal was to use another helper that worked on static
> > strings like this. Linus rejected that idea, so we're in a weird place.
> > I think we could perhaps build a strcpy() replacement that requires
> > compile-time validated arguments, and to break the build if not.
> >
> > i.e.
> >
> > given:
> > 	char array[8];
> > 	char *ptr;
> >
> > allow:
> >
> >
> > 	strcpy(array, "1234567");
> >
> > disallow:
> >
> > 	strcpy(array, "12345678");	/* too long */
> > 	strcpy(array, src);		/* not optimized, so use strscpy? */
> > 	strcpy(ptr, "1234567");		/* unknown destination size */
> > 	strcpy(ptr, src);		/* unknown destination size */
> 
> I think that's not a good idea as it's not a generic equivalent of the
> string.h code.
> 
> I still like the stracpy variant I proposed:
> 
> https://lore.kernel.org/lkml/24bb53c57767c1c2a8f266c305a670f7@sk2.org/T/#m0627aa770a076af1937cb5c610ed
> 71dab3f1da72
> https://lore.kernel.org/lkml/CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com/
> 
> Linus liked a variant he called copy_string:
> 
> https://lore.kernel.org/lkml/CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com/
> 
> I think the cocci scripts that convert:
> 
> 	strlcpy -> strscpy (only when return value unused)
> 	str<sln>cpy(array, "string") -> stracpy(foo, "string")
> 	s[cn]printf -> sysfs_emit
> 
> would leave relatively few uses of strcpy and sprintf variants and would
> make it much easier to analyze the remainder uses for potential overflows.

The advantage of allowing strcpy() but only when the when it can be
converted into a non-overflowing memcpy() is that you know that the
copies never get truncated.

The next round of string copy errors could easily by the 'silent truncation'
ones - so using such a strcpy() will cut down the next audit.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
