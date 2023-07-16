Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91426EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F075360AF1;
	Sun, 16 Jul 2023 19:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F075360AF1
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ubP9Plsp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PG2vO7O3CPBA; Sun, 16 Jul 2023 19:41:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BBECF60BEB;
	Sun, 16 Jul 2023 19:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBECF60BEB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE5AC0071;
	Sun, 16 Jul 2023 19:41:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDB4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 19:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6203240903
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 19:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6203240903
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=ubP9Plsp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOne_dIcOjWC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 19:41:02 +0000 (UTC)
X-Greylist: delayed 00:05:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1ED408D0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C1ED408D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689536458; x=1690141258; i=markus.elfring@web.de;
 bh=+uuRyE1bNNRzqrGtckrAJ6dm1r7ODtvY9NvDovsnT4o=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=ubP9Plsp7wOPP7bzrrJyEQ0IKAOw4698XRvJ9E7JoDhhdiER7a3UoQohOub9X2PEz2QbqeB
 YERUI+HHbYj4r934qt6zJJC5kI/y5YC5TRCscK8nBj/hqVLjCSyKApzz6HDB/PBnHG4ymTKRn
 52GXsbAZwJDDzUaWoCybcOW1TOp+TZKy21bSj94VqRkXkFvptoE5qu4Gzx2+7YAy+sVpxAj9h
 7QEQYH/BKr1Met5Bqztqs/0T4waNbZOLDVhP7/UxDwRarg7BSLK2Zif+7d+NLtTcSPIaiOaSr
 cv16OD0pwXRNd01ecclLGRCl4dVdNTEvhNI5mNp6rTuBHTPhNqdw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsKH-1pe7Pe2QLr-00ipe5; Sun, 16
 Jul 2023 21:35:29 +0200
Message-ID: <741714f4-5997-5688-21ca-1e2ff1839dfb@web.de>
Date: Sun, 16 Jul 2023 21:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shuah Khan <shuah@kernel.org>
References: <20230716181825.44337-1-atulpant.linux@gmail.com>
Subject: Re: [PATCH v4] selftests: rtc: Improve rtctest error handling
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230716181825.44337-1-atulpant.linux@gmail.com>
X-Provags-ID: V03:K1:8MAV4p0qvMSHLwKpJ3N2EYzgqbWU0DQ5IcmzdSNb2PwJBYTSpis
 TKgGqNf2U9muGPIfx0C748r/kNXc/vSNYLnsts6vyJRGW3t/ezEUgu++krt1dWdtngyTcT7
 b4v3IF1hQ0/XRhF9dXJLKUP8j9KpdpZLUekDreaY0n79tcMxCydjykR+Qiz6T1XPtGT94R8
 WwMh+AGnwSt+0DBy6XE4A==
UI-OutboundReport: notjunk:1;M01:P0:jRT8KChJHbo=;614pqXKSddfc0KLQEGmWVeqwRZ5
 d/9KQdQuE/ThpISDPg07u3BprXwsP2nMd+SHBUMgAXFgS1ACdFnXmYQ901kQSryNXmd2783ed
 3nXeMf2E7AZMbqGxZ7F26fGyOq5HUhI6EUJRBxNZaq2T6sKefiDTOjSonCXXejtP7vOkXuKbw
 CSx77qDwk2nWPzauxD0z3Am6HuxsXOaWo+bi5hdMheVOWZiJSbVwB4908LEmMH9CWzUwMdl9y
 bIsZNknQJ0Dd67ZLNnamQNd8FReMcw08irngO3n8eBUMHE6Pyc5uzsr4q13kMvsnnHxYI1GJE
 Bor4mX1Ov4UgL99NYzSv9vFE0HmxQORNwgpz+jcqGINmdL1WEeH9le74BXTr3a3V9B+3W+fL2
 cAvp9OLksa3m4mMkbkRNOGLjWI1Ey5YtVEhgfc0bXlwVJdAHd8ev2YUhTh8U3sMBFfpLlBvnL
 Z2f2bw1VxfTKundDgbU75Ad9zRh2vcPYHLVL4FvMLmQIyYgreHxpk/g3pnzZFjOB/yr+cH4kR
 P7vPJY1MfK3Ab4Vi9ZL8I0uQO6sUYTDCDmjsoc71M8dj5hCApSGoIoGKdMFvRsLH+pKx5Al0v
 S0NKx4FqiqRJK8YVQVAKbH8scDWwgCnuv1+RywL9azhQJgk6/GFZm8kOTcDV1pEaeFLmpmHXH
 n78n7YT1qRJjVMFp7lPH+HsBTIK7qhueEgiAhC/HHKDWju7e2MQokwYNC9McvMoQPVxpkKB1L
 wVe96vH4xhEJNJun0ZvAfEwCfC8fA2MoGcqOuRuj1m9WO9IA0Q/xWbEuNytsCtIv4UBCXopvp
 m+nmUloq/efmYttNRDjStO44NiNOEGXGsOqSL+QbYGK5tdZPnQ748H5KEMyuGlHpgSpemoD4j
 dEW6XTtMY5IJyNGH8MY6QtrW3CgbUmLWOt1UbP9Lui7X4FB2rtyj3BWtwAYg3KZwR6XCIPTek
 p8gVNg==
Cc: LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

4oCmCj4gVG8gaGFuZGxlIHRoaXMsIHRoZSBwYXRjaCBhZGRzIGEgY2hlY2tzIHRvIHZlcmlmeSBp
ZiB0aGUgcnRjX2ZpbGUgaXMgdmFsaWQuCgpDYW4gYSB0eXBvIGJlIGF2b2lkZWQgaW4gdGhpcyBt
ZXNzYWdlPwoKQXJlIGltcGVyYXRpdmUgY2hhbmdlIGRlc2NyaXB0aW9ucyBzdGlsbCBwcmVmZXJy
ZWQ/CgpTZWUgYWxzbzoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1p
dHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni41LXJjMSNuOTQKCgpIb3cgZG8geW91IHRoaW5rIGFib3V0
IHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVz
IG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWtlcm5lbC1tZW50ZWVzCg==
