Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42047C727C5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 09:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965DE41E96;
	Fri, 25 Aug 2023 09:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 965DE41E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ci2TeXB3rU3L; Fri, 25 Aug 2023 09:33:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 57BD141D8F;
	Fri, 25 Aug 2023 09:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BD141D8F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E01DC0071;
	Fri, 25 Aug 2023 09:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD26C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 09:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FF5983A88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 09:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF5983A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qpb2NNYgFb6y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 09:33:17 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24DD483A8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 09:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DD483A8B
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-2-CWXtiu9VOBa0HfxzC4PXkQ-1; Fri, 25 Aug 2023 10:32:04 +0100
X-MC-Unique: CWXtiu9VOBa0HfxzC4PXkQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 25 Aug
 2023 10:32:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 25 Aug 2023 10:32:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mahmoud Maatuq' <mahmoudmatook.mm@gmail.com>, "keescook@chromium.org"
 <keescook@chromium.org>, "edumazet@google.com" <edumazet@google.com>,
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
 "wad@chromium.org" <wad@chromium.org>, "luto@amacapital.net"
 <luto@amacapital.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>
Subject: RE: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
Thread-Topic: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
Thread-Index: AQHZ1slDuEzSfgmyIkyLho9d3Y2q6K/6vr1A
Date: Fri, 25 Aug 2023 09:32:02 +0000
Message-ID: <dd7b956916e044b181e7ccd1823f14ec@AcuMS.aculab.com>
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
In-Reply-To: <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
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

From: Mahmoud Maatuq
> Sent: 24 August 2023 21:24
....
>  		tdeliver = glob_tstart + ts->delay_us * 1000;
> -		tdeliver_max = tdeliver_max > tdeliver ?
> -			       tdeliver_max : tdeliver;
> +		tdeliver_max = max(tdeliver_max, tdeliver);

That was spectacularly horrid...
What is wrong with using:
	if (tdeliver > tdeliver_max)
		tdeliver_max = tdeliver;
That is pretty obviously calculating the upper bound.
Even the version with max() needs extra parsing by the human reader.

(The only issue is whether it reads better with the if condition
reversed.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
