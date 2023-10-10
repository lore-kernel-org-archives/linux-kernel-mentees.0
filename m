Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D167CD8CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 19:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88FF417A1;
	Tue, 10 Oct 2023 19:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88FF417A1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=kSiUyrrs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD9StZsf1VHB; Tue, 10 Oct 2023 19:04:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 65392410A0;
	Tue, 10 Oct 2023 19:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65392410A0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29A70C0039;
	Tue, 10 Oct 2023 19:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36339C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 19:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19BE81E0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 19:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19BE81E0D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de
 header.a=rsa-sha256 header.s=mail header.b=kSiUyrrs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kUMfQoTlO2U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 19:04:10 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A19981E06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 19:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A19981E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1696964646; bh=3MpUfcVd0SIAi956WNWhjBSMQfD+4nqTDl8IQsMjp04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kSiUyrrssGx4J7Y/Djzrr+iFdAHLnoTbeh1F2XcHUrVKwS2VH6SEoVG6C9aSAkUDH
 2GCrqhnW6G0dV+45uHauRzSAZz/F1sbdn4SWgSX5YTAgVoC7gRwDIXAWHuqqMyljtu
 uRRKo5c7nYUokZ5FjTd1rU7vy6pBEAecGrVUDWYs=
Date: Tue, 10 Oct 2023 21:04:05 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Anshul Dalal <anshulusr@gmail.com>
Subject: Re: [PATCH v4 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Message-ID: <8fbd4f6c-b1cf-4924-9e4b-2b9455b42e41@t-8ch.de>
References: <20231010184827.1213507-1-anshulusr@gmail.com>
 <20231010184827.1213507-2-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010184827.1213507-2-anshulusr@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
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

T24gMjAyMy0xMC0xMSAwMDoxODoyNCswNTMwLCBBbnNodWwgRGFsYWwgd3JvdGU6Cj4gQWRkcyBh
IGRyaXZlciBmb3IgYSBtaW5pIGdhbWVwYWQgdGhhdCBjb21tdW5pY2F0ZXMgb3ZlciBpMmMsIHRo
ZSBnYW1lcGFkCj4gaGFzIGJpZGlyZWN0aW9uYWwgdGh1bWIgc3RpY2sgaW5wdXQgYW5kIHNpeCBi
dXR0b25zLgo+IAo+IFRoZSBnYW1lcGFkIGNoaXAgdXRpbGl6ZXMgdGhlIG9wZW4gZnJhbWV3b3Jr
IGZyb20gQWRhZnJ1aXQgY2FsbGVkICdTZWVzYXcnCj4gdG8gdHJhbnNtaXQgdGhlIEFEQyBkYXRh
IGZvciB0aGUgam95c3RpY2sgYW5kIGRpZ2l0YWwgcGluIHN0YXRlIGZvciB0aGUKPiBidXR0b25z
LiBJIGhhdmUgb25seSBpbXBsZW1lbnRlZCB0aGUgZnVuY3Rpb25hbGl0eSByZXF1aXJlZCB0byBy
ZWNlaXZlIHRoZQo+IHRodW1iIHN0aWNrIGFuZCBidXR0b24gc3RhdGUuCj4gCj4gU3RlcHMgaW4g
cmVhZGluZyB0aGUgZ2FtZXBhZCBzdGF0ZSBvdmVyIGkyYzoKPiAgIDEuIFJlc2V0IHRoZSByZWdp
c3RlcnMKPiAgIDIuIFNldCB0aGUgcGluIG1vZGUgb2YgdGhlIHBpbnMgc3BlY2lmaWVkIGJ5IHRo
ZSBgQlVUVE9OX01BU0tgIHRvIGlucHV0Cj4gICAgICAgYEJVVFRPTl9NQVNLYDogQSBiaXQtbWFw
IGZvciB0aGUgc2l4IGRpZ2l0YWwgcGlucyBpbnRlcm5hbGx5Cj4gICAgICAgIGNvbm5lY3RlZCB0
byB0aGUgam95c3RpY2sgYnV0dG9ucy4KPiAgIDMuIEVuYWJsZSBpbnRlcm5hbCBwdWxsdXAgcmVz
aXN0b3JzIGZvciB0aGUgYEJVVFRPTl9NQVNLYAo+ICAgNC4gQnVsayBzZXQgdGhlIHBpbiBzdGF0
ZSBISUdIIGZvciBgQlVUVE9OX01BU0tgCj4gICA1LiBQb2xsIHRoZSBkZXZpY2UgZm9yIGJ1dHRv
biBhbmQgam95c3RpY2sgc3RhdGUgZG9uZSBieToKPiAgICAgICBgc2Vlc2F3X3JlYWRfZGF0YShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBzdHJ1Y3Qgc2Vlc2F3X2RhdGEgKmRhdGEpYAo+IAo+
IFByb2R1Y3QgcGFnZToKPiAgIGh0dHBzOi8vd3d3LmFkYWZydWl0LmNvbS9wcm9kdWN0LzU3NDMK
PiBBcmR1aW5vIGRyaXZlcjoKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9hZGFmcnVpdC9BZGFmcnVp
dF9TZWVzYXcKPiAKPiBEcml2ZXIgdGVzdGVkIG9uIFJQaSBaZXJvIDJXCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5zaHVsIERhbGFsIDxhbnNodWx1c3JAZ21haWwuY29tPgoKSW4gZ2VuZXJhbDoKClJl
dmlld2VkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+CgpCdXQg
b25lIG1vcmUgbml0cGljayBiZWxvdzoKCj4gWy4uXQoKPiArc3RhdGljIHZvaWQgc2Vlc2F3X3Bv
bGwoc3RydWN0IGlucHV0X2RldiAqaW5wdXQpCj4gK3sKPiArCXN0cnVjdCBzZWVzYXdfZ2FtZXBh
ZCAqcHJpdmF0ZSA9IGlucHV0X2dldF9kcnZkYXRhKGlucHV0KTsKPiArCXN0cnVjdCBzZWVzYXdf
ZGF0YSBkYXRhOwo+ICsJaW50IGVycjsKPiArCj4gKwllcnIgPSBzZWVzYXdfcmVhZF9kYXRhKHBy
aXZhdGUtPmkyY19jbGllbnQsICZkYXRhKTsKPiArCWlmIChlcnIgIT0gMCkKPiArCQlyZXR1cm47
CgpUaGlzIHNob3VsZCBiZSBsb2dnZWQgYXQgZGVidWcgbGV2ZWwsIHNvIHRoZSB1c2VyIGhhcyBz
b21lIHNvcnQgb2YKY2hhbmNlIHRvIGZpZ3VyZSBvdXQgaWYgc29tZXRoaW5nIGlzIGJyb2tlbi4K
Cj4gKwo+ICsJaW5wdXRfcmVwb3J0X2FicyhpbnB1dCwgQUJTX1gsIGRhdGEueCk7Cj4gKwlpbnB1
dF9yZXBvcnRfYWJzKGlucHV0LCBBQlNfWSwgZGF0YS55KTsKPiArCWlucHV0X3JlcG9ydF9rZXko
aW5wdXQsIEJUTl9FQVNULCBkYXRhLmJ1dHRvbl9hKTsKPiArCWlucHV0X3JlcG9ydF9rZXkoaW5w
dXQsIEJUTl9TT1VUSCwgZGF0YS5idXR0b25fYik7Cj4gKwlpbnB1dF9yZXBvcnRfa2V5KGlucHV0
LCBCVE5fTk9SVEgsIGRhdGEuYnV0dG9uX3gpOwo+ICsJaW5wdXRfcmVwb3J0X2tleShpbnB1dCwg
QlROX1dFU1QsIGRhdGEuYnV0dG9uX3kpOwo+ICsJaW5wdXRfcmVwb3J0X2tleShpbnB1dCwgQlRO
X1NUQVJULCBkYXRhLmJ1dHRvbl9zdGFydCk7Cj4gKwlpbnB1dF9yZXBvcnRfa2V5KGlucHV0LCBC
VE5fU0VMRUNULCBkYXRhLmJ1dHRvbl9zZWxlY3QpOwo+ICsJaW5wdXRfc3luYyhpbnB1dCk7Cj4g
K30KCj4gWy4uXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNA
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
