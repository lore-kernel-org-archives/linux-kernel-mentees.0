Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811FC3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 08:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB68380CB3;
	Thu, 24 Aug 2023 08:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB68380CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v46NNRugb5b4; Thu, 24 Aug 2023 08:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D5BEC80C05;
	Thu, 24 Aug 2023 08:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5BEC80C05
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A35E7C0039;
	Thu, 24 Aug 2023 08:53:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52D6DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BB80402E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB80402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuP-lK_2SqBL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:53:34 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF894402BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF894402BC
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-21-1nU0YSAiNYCfvxfcnnRqsg-1; Thu, 24 Aug 2023 09:53:29 +0100
X-MC-Unique: 1nU0YSAiNYCfvxfcnnRqsg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 24 Aug
 2023 09:53:25 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 24 Aug 2023 09:53:25 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mahmoud Matook' <mahmoudmatook.mm@gmail.com>
Subject: RE: [PATCH 1/2] selftests: Provide local define of min() and max()
Thread-Topic: [PATCH 1/2] selftests: Provide local define of min() and max()
Thread-Index: AQHZ03nFpJJs9cS/jEaiicM+CY14+6/0t4aQgAGcP4CAABL1kIAB05OAgADtwiA=
Date: Thu, 24 Aug 2023 08:53:25 +0000
Message-ID: <956ab0e63b8340669c31d2452830b7f3@AcuMS.aculab.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
 <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
 <7e8c2597c71647f38cd4672cbef53a66@AcuMS.aculab.com>
 <CAF=yD-+6cWTiDgpsu=hUV+OvzDFRaT2ZUmtQo9qTrCB9i-+7ng@mail.gmail.com>
 <d33fbb24119c4d09864e79ea9dfbb881@AcuMS.aculab.com>
 <20230823193545.nrzlbsa32hm4os4k@mmaatuq-HP-Laptop-15-dy2xxx>
In-Reply-To: <20230823193545.nrzlbsa32hm4os4k@mmaatuq-HP-Laptop-15-dy2xxx>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: 'Willem de Bruijn' <willemdebruijn.kernel@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

From: Mahmoud Matook
> Sent: Wednesday, August 23, 2023 8:36 PM
...
> I tried to use the relaxed version provided in the shared patchset link
> besides not able to use is_constexpr(), I'm not able to use
> __UNIQUE_ID() also. It's definded inside include/linux/compiler-gcc.h
> and it uses another macro __PASTE() which is defined inside
> include/linux/compiler_types.h.
> not sure what to do next
>
> - bring those macros definitions to able to use the relaxed version.
> - if the most important point for min/max defines inside selftests is to
>   avoid multiple evaluation is the below version acceptable?
>
>   #define min(x, y) ({ \
>     typeof(x) _x = (x); \
>     typeof(y) _y = (y); \
>     _x < _y ? _x : _y; \
> })
> 
> #define max(x, y) ({ \
>     typeof(x) _x = (x); \
>     typeof(y) _y = (y); \
>     _x > _y ? _x : _y; \
> })

Those are a reasonable pair.

If you want a signed-ness check the:
	_Static_assert(is_signed_type(typeof(a)) == is_signed_type(typeof(b)), "min/max signednesss")
check should just drop into the above.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
