Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644DEC25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Oct 2023 15:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29BE703E3;
	Tue, 24 Oct 2023 15:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29BE703E3
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=aK7qefab
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5h1rsGgufxH; Tue, 24 Oct 2023 15:57:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5A8CE703D9;
	Tue, 24 Oct 2023 15:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A8CE703D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32D3EC0071;
	Tue, 24 Oct 2023 15:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C90FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 15:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FAAA4ED1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 15:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FAAA4ED1A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de
 header.a=rsa-sha256 header.s=mail header.b=aK7qefab
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4SB8uaeyruz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 15:57:05 +0000 (UTC)
X-Greylist: delayed 122454 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 24 Oct 2023 15:57:05 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 045A34ED0D
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 045A34ED0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1698163020; bh=BNVJRacOEROOJUbOi3+VHcE+dWCyfrMR1wZHRSbWoM0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aK7qefabd1HYLkS2rsJZke9BfVu/vDcyrJRTkRqhCctijuPOl27YWMUK0xzwwgZD5
 8Hnf4FIfOL37zBXuKz6VYkKnjsiSMvqtSihMZm414gVikRARfNR/ju5dcQOQNDWpU9
 +QutV/PKBIwRHkhBgW/Oyoz9TVZ6JYpBVrap1NJg=
Date: Tue, 24 Oct 2023 17:56:47 +0200 (GMT+02:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Jeff LaBundy <jeff@labundy.com>
Message-ID: <51c4ab9a-1d45-4665-bb27-0214a9588a1c@t-8ch.de>
In-Reply-To: <ZTbklpRhpMIPey2j@nixie71>
References: <20231017034356.1436677-1-anshulusr@gmail.com>
 <20231017034356.1436677-2-anshulusr@gmail.com> <ZTWza+S+t+UZKlwu@nixie71>
 <00d2fcbc-3fd8-477d-8df1-afec20b458b6@t-8ch.de> <ZTbklpRhpMIPey2j@nixie71>
Subject: Re: [PATCH v5 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
MIME-Version: 1.0
X-Correlation-ID: <51c4ab9a-1d45-4665-bb27-0214a9588a1c@t-8ch.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

SGkgSmVmZiwKCk9jdCAyMywgMjAyMyAyMzoyNDo1NSBKZWZmIExhQnVuZHkgPGplZmZAbGFidW5k
eS5jb20+Ogo+IE9uIE1vbiwgT2N0IDIzLCAyMDIzIGF0IDA3OjU1OjUyQU0gKzAyMDAsIFRob21h
cyBXZWnDn3NjaHVowqAgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+Pj4gK8KgwqAgZXJyID0gaTJjX21h
c3Rlcl9zZW5kKGNsaWVudCwgd3JpdGVfYnVmLCBzaXplb2Yod3JpdGVfYnVmKSk7Cj4+Pj4gK8Kg
wqAgaWYgKGVyciA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4KPj4+IFlv
dSBjb3JyZWN0bHkgcmV0dXJuIGVyciAob3IgcmF0aGVyLCByZXQpIGZvciBuZWdhdGl2ZSB2YWx1
ZXMsIGJ1dCB5b3Ugc2hvdWxkIGFsc28KPj4+IGNoZWNrIHRoYXQgcmV0IG1hdGNoZXMgdGhlIHNp
emUgb2YgdGhlIGRhdGEgc2VudC4gRm9yIDAgPD0gcmV0IDwgc2l6ZW9mKHdyaXRlYnVmKSwKPj4+
IHJldHVybiAtRUlPLgo+Pgo+PiBUaGUgZHJpdmVyIGRpZCB0aGlzIG9yaWdpbmFsbHkuCj4+IEkg
dGhlbiByZXF1ZXN0ZWQgaXQgdG8gYmUgcmVtb3ZlZCBhcyB0aGlzIGNhc2UKPj4gY2FuIG5ldmVy
IGhhcHBlbi4KPj4gaTJjX21hc3Rlcl9zZW5kIHdpbGwgZWl0aGVyIHJldHVybiBzaXplIG9mKHdy
aXRlYnVmKSBvciBhbiBlcnJvci4KPgo+IEdyZWF0IGNhdGNoOyBpbmRlZWQgeW91IGFyZSBjb3Jy
ZWN0LiBBcG9sb2dpZXMgZm9yIGhhdmluZyBtaXNzZWQgdGhpcwo+IGluIHRoZSBjaGFuZ2UgbG9n
OyB0aGlzIGlzIGdvb2QgdG8ga25vdyBpbiB0aGUgZnV0dXJlLgoKSSBndWVzcyBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIGFsc28gYWRhcHQgdGhlCmZ1bmN0aW9uIGRvY3VtZW50YXRpb24gdG8gYmUg
bW9yZSBleHBsaWNpdAphYm91dCB0aGlzIGludmFyaWFudC4KTm8gbmVlZCB0byBjb21wbGljYXRl
IGV2ZXJ5IGNhbGxlciB1bm5lY2Vzc2FyaWx5LgoKSSBjYW4gc2VuZCBhIHBhdGNoIHNvbWV3aGVy
ZSBuZXh0IHdlZWssIGJ1dAppZiB5b3Ugd2FudCB0byBzZW5kIG9uZSBJJ2xsIGJlIGhhcHB5IHRv
IHJldmlldyBpdC4KCj4gVGhhdCBiZWluZyBzYWlkLCBpdCdzIGEgbW9vdCBwb2ludCBJTU87IHRo
aXMgZHJpdmVyIHNlZW1zIGxpa2UgYSBnb29kCj4gY2FuZGlkYXRlIGZvciByZWdtYXAuIElmIHJl
Z21hcCBjYW5ub3QgYmUgbWFkZSB0byB3b3JrIGhlcmUgZm9yIHNvbWUKPiByZWFzb24sIHRoZW4g
SSdkIGxpa2UgdG8gYXQgbGVhc3Qgc2VlIHNvbWUgd3JhcHBlciBmdW5jdGlvbnMgdG8gYXZvaWQK
PiBkdXBsaWNhdGUgY29kZSBhbmQgbWFudWFsIGFzc2lnbm1lbnRzIHRvIGEgYnVmZmVyLgoKQWNr
LgoKVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0Bs
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
