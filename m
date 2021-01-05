Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:22:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E65422288
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E65422288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1C212214EC;
	Tue,  5 Jan 2021 10:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rddB8I1i1xCN; Tue,  5 Jan 2021 10:22:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C81BA203AB;
	Tue,  5 Jan 2021 10:22:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2318C088B;
	Tue,  5 Jan 2021 10:22:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC020C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA18385D68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpBV8ut171ku
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:22:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3310285D52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:22:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-30-uoFF9HGNMyeCKOzMT-0d8g-1; Tue, 05 Jan 2021 10:20:07 +0000
X-MC-Unique: uoFF9HGNMyeCKOzMT-0d8g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 5 Jan 2021 10:20:07 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 5 Jan 2021 10:20:07 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>
Thread-Topic: [PATCH] checkpatch: add a new check for strcpy/strlcpy uses
Thread-Index: AQHW4z9Q88VHmIJ6eEaZbDSrKKOd0aoY0EBw
Date: Tue, 5 Jan 2021 10:20:07 +0000
Message-ID: <d081ca22bbd44f969fa45a8abc543606@AcuMS.aculab.com>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
In-Reply-To: <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
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
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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
> Sent: 05 January 2021 08:44
> 
> On Tue, 2021-01-05 at 13:53 +0530, Dwaipayan Ray wrote:
> > strcpy() performs no bounds checking on the destination buffer.
> > This could result in linear overflows beyond the end of the buffer.
> >
> > strlcpy() reads the entire source buffer first. This read
> > may exceed the destination size limit. This can be both inefficient
> > and lead to linear read overflows.
> >
> > The safe replacement to both of these is to use strscpy() instead.
> > Add a new checkpatch warning which alerts the user on finding usage of
> > strcpy() or strlcpy().
> 
> I do not believe that strscpy is preferred over strcpy.
> 
> When the size of the output buffer is known to be larger
> than the input, strcpy is faster.
> 
> There are about 2k uses of strcpy.
> Is there a use where strcpy use actually matters?
> I don't know offhand...
> 
> But I believe compilers do not optimize away the uses of strscpy
> to a simple memcpy like they do for strcpy with a const from
> 
> 	strcpy(foo, "bar");

It ought to be possible to convert:
	strscpy(foo, "bar", constant_sz)
to a memcpy() within the .h file.

Similarly it should be possible to error
	strcpy(foo, "bar")
Unless foo is large enough and "bar" is constant.

After all with a length check
	strcpy(foo, "bar")
is actually safer than
	strspy(foo, "bar", sizeof foo)
because there is less room for error.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
