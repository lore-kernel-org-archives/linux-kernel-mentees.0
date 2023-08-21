Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7925AEE49A6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Aug 2023 13:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77DF81E16;
	Mon, 21 Aug 2023 13:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77DF81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECodZA6R4tt2; Mon, 21 Aug 2023 13:05:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DE8DB81E0F;
	Mon, 21 Aug 2023 13:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8DB81E0F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4EE2C0071;
	Mon, 21 Aug 2023 13:05:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42CD4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 13:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1735681E12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 13:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1735681E12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iP6aD8Wf8cOl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 13:05:10 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9978A81E0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 13:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9978A81E0F
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-193-2ku7-XKJNSuRNmkn66H0_Q-1; Mon, 21 Aug 2023 14:05:06 +0100
X-MC-Unique: 2ku7-XKJNSuRNmkn66H0_Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 21 Aug
 2023 14:04:54 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 21 Aug 2023 14:04:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Willem de Bruijn' <willemdebruijn.kernel@gmail.com>, Mahmoud Maatuq
 <mahmoudmatook.mm@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "edumazet@google.com" <edumazet@google.com>, "shuah@kernel.org"
 <shuah@kernel.org>
Subject: RE: [PATCH 1/2] selftests: Provide local define of min() and max()
Thread-Topic: [PATCH 1/2] selftests: Provide local define of min() and max()
Thread-Index: AQHZ03nFpJJs9cS/jEaiicM+CY14+6/0t4aQ
Date: Mon, 21 Aug 2023 13:04:54 +0000
Message-ID: <7e8c2597c71647f38cd4672cbef53a66@AcuMS.aculab.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
 <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
In-Reply-To: <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

From: Willem de Bruijn
> Sent: Sunday, August 20, 2023 4:15 PM
> 
> Mahmoud Maatuq wrote:
> > to avoid manual calculation of min and max values
> > and fix coccinelle warnings such WARNING opportunity for min()/max()
> > adding one common definition that could be used in multiple files
> > under selftests.
> > there are also some defines for min/max scattered locally inside sources
> > under selftests.
> > this also prepares for cleaning up those redundant defines and include
> > kselftest.h instead.
> >
> > Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> > ---
> >  tools/testing/selftests/kselftest.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> > index 829be379545a..e8eb7e9afbc6 100644
> > --- a/tools/testing/selftests/kselftest.h
> > +++ b/tools/testing/selftests/kselftest.h
> > @@ -55,6 +55,13 @@
> >  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> >  #endif
> >
> > +#ifndef min
> > +# define min(x, y) ((x) < (y) ? (x) : (y))
> > +#endif
> > +#ifndef max
> > +# define max(x, y) ((x) < (y) ? (y) : (x))
> > +#endif
> > +
> 
> Should this more closely follow include/linux/minmax.h, which is a lot
> more strict?
> 
> I'm fine with this simpler, more relaxed, version for testing, but
> calling it out for people to speak up.
> 
> Only the first two of these comments in minmax.h apply to this
> userspace code.
> 
> /*
>  * min()/max()/clamp() macros must accomplish three things:
>  *
>  * - avoid multiple evaluations of the arguments (so side-effects like
>  *   "x++" happen only once) when non-constant.
>  * - perform strict type-checking (to generate warnings instead of
>  *   nasty runtime surprises). See the "unnecessary" pointer comparison
>  *   in __typecheck().
>  * - retain result as a constant expressions when called with only
>  *   constant expressions (to avoid tripping VLA warnings in stack
>  *   allocation usage).
>  */
> 
> Note that a more strict version that includes __typecheck would
> warn on the type difference between total_len and cfg_mss. Fine
> with changing the type of cfg_mss in the follow-on patch to address
> that.

That typecheck() is horrid.
It may well have caused more bugs due to incorrect casts that
it actually detected.

I'd suggest the version that just avoids multiple evaluations.
Or just error signed v unsigned comparisons.
See  https://lore.kernel.org/all/b4ce9dad748e489f9314a2dc95615033@AcuMS.aculab.com/
for an example patch set.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
