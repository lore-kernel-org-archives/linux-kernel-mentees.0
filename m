Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703FC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 02:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C093781FD2;
	Tue, 31 Oct 2023 02:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C093781FD2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=VCaxTTHF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROi_cxuErsaU; Tue, 31 Oct 2023 02:24:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7A00E81F5A;
	Tue, 31 Oct 2023 02:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A00E81F5A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CE69C0039;
	Tue, 31 Oct 2023 02:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41621C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 02:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9F260F64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 02:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9F260F64
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de
 header.a=rsa-sha256 header.s=mail header.b=VCaxTTHF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4ovQfjvsbla
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 02:24:00 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B648160F62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 02:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B648160F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1698719035; bh=/JXD693pREHWBy4Dt1P8oq518aZztsASJG12CVDqGd4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VCaxTTHFTKV4VoGo4Xi5uxOiBwUKCxgjJyd6GwaWUpyuWaCznQi6QJfiresw8S0/0
 nbj7cG9IwdCosnkBCRagjNwUEP3X5azPRtKFWJBDpCRzttYJaDbeRpfliNWItVEv3c
 E5yg2WFyUhZj+Z7YWRraaFQwmYC534q+Km/Imgwg=
Date: Tue, 31 Oct 2023 03:23:38 +0100 (GMT+01:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Anshul Dalal <anshulusr@gmail.com>
Message-ID: <9c9f6171-f879-46f5-81d2-6764257a49eb@t-8ch.de>
In-Reply-To: <efea5ae2-7e41-4b78-a283-1f907be560b0@gmail.com>
References: <20231027051819.81333-1-anshulusr@gmail.com>
 <20231027051819.81333-2-anshulusr@gmail.com>
 <d1dd2142-546f-42b7-8966-ab75fd4f8817@t-8ch.de>
 <efea5ae2-7e41-4b78-a283-1f907be560b0@gmail.com>
Subject: Re: [PATCH v6 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
MIME-Version: 1.0
X-Correlation-ID: <9c9f6171-f879-46f5-81d2-6764257a49eb@t-8ch.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T2N0IDMxLCAyMDIzIDAzOjEwOjUwIEFuc2h1bCBEYWxhbCA8YW5zaHVsdXNyQGdtYWlsLmNvbT46
Cgo+IEhlbGxvIFRob21hcywKPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEgVGhlIHJlcXVlc3Rl
ZCBjaGFuZ2VzIHdpbGwgYmUgYWRkcmVzc2VkIGluIHRoZQo+IG5leHQgcGF0Y2ggdmVyc2lvbiB0
aG91Z2ggSSBoYWQgYSBmZXcgY29tbWVudHMgYmVsb3c6Cj4KPiBPbiAxMC8yNy8yMyAxMTo0NCwg
VGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+IEhpIEFuc2h1bCwKPj4KPj4gdGhhbmtzIGZvciB0
aGUgcmV3b3JrcyEKPj4KPj4gU29tZSBtb3JlIGNvbW1lbnRzIGlubGluZS4KPj4KPj4gT24gMjAy
My0xMC0yNyAxMDo0ODoxMSswNTMwLCBBbnNodWwgRGFsYWwgd3JvdGU6CgpbLi5dCgo+Pj4gK3N0
cnVjdCBzZWVzYXdfYnV0dG9uX2Rlc2NyaXB0aW9uIHsKPj4+ICvCoMKgIHVuc2lnbmVkIGludCBj
b2RlOwo+Pj4gK8KgwqAgdW5zaWduZWQgaW50IGJpdDsKPj4+ICt9Owo+Pj4gKwo+Pj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc2Vlc2F3X2J1dHRvbl9kZXNjcmlwdGlvbiBzZWVzYXdfYnV0dG9uc1td
ID0gewo+Pj4gK8KgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoCAuY29kZSA9IEJUTl9FQVNULAo+Pj4g
K8KgwqDCoMKgwqDCoCAuYml0ID0gU0VFU0FXX0JVVFRPTl9BLAo+Pj4gK8KgwqAgfSwKPj4+ICvC
oMKgIHsKPj4+ICvCoMKgwqDCoMKgwqAgLmNvZGUgPSBCVE5fU09VVEgsCj4+PiArwqDCoMKgwqDC
oMKgIC5iaXQgPSBTRUVTQVdfQlVUVE9OX0IsCj4+PiArwqDCoCB9LAo+Pj4gK8KgwqAgewo+Pj4g
K8KgwqDCoMKgwqDCoCAuY29kZSA9IEJUTl9OT1JUSCwKPj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9
IFNFRVNBV19CVVRUT05fWCwKPj4+ICvCoMKgIH0sCj4+PiArwqDCoCB7Cj4+PiArwqDCoMKgwqDC
oMKgIC5jb2RlID0gQlROX1dFU1QsCj4+PiArwqDCoMKgwqDCoMKgIC5iaXQgPSBTRUVTQVdfQlVU
VE9OX1ksCj4+PiArwqDCoCB9LAo+Pj4gK8KgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoCAuY29kZSA9
IEJUTl9TVEFSVCwKPj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fU1RBUlQs
Cj4+PiArwqDCoCB9LAo+Pj4gK8KgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoCAuY29kZSA9IEJUTl9T
RUxFQ1QsCj4+PiArwqDCoMKgwqDCoMKgIC5iaXQgPSBTRUVTQVdfQlVUVE9OX1NFTEVDVCwKPj4+
ICvCoMKgIH0sCj4+PiArfTsKPj4KPj4gVGhpcyBsb29rcyB2ZXJ5IG11Y2ggbGlrZSBhIHNwYXJz
ZSBrZXltYXAgd2hpY2ggY2FuIGJlIGltcGxlbWVudGVkIHdpdGgKPj4gdGhlIGhlbHBlcnMgZnJv
bSA8bGludXgvaW5wdXQvc3BhcnNlLWtleW1hcC5oPi4KPj4KPgo+IFdoZW4gZ29pbmcgdGhyb3Vn
aCB0aGUgQVBJIHByb3ZpZGVkIGJ5IHNwYXJzZS1rZXltYXAsIEkgY291bGQgb25seSBzZWUKPiB0
aGUgdXNlIGZvciBzcGFyc2Vfa2V5bWFwX3JlcG9ydF9lbnRyeSBoZXJlLiBXaGljaCBsZWFkcyB0
byB0aGUKPiBmb2xsb3dpbmcgcmVmYWN0b3JlZCBjb2RlOgo+Cj4gc3RhdGljIGNvbnN0IHN0cnVj
dCBrZXlfZW50cnkgc2Vlc2F3X2J1dHRvbnNfbmV3W10gPSB7Cj4gwqDCoMKgIHtLRV9LRVksIFNF
RVNBV19CVVRUT05fQSwge0JUTl9TT1VUSH19LAo+IMKgwqDCoCB7S0VfS0VZLCBTRUVTQVdfQlVU
VE9OX0IsIHtCVE5fRUFTVH19LAoKTm8gYnJhY2VzIEkgdGhpbmsuCgo+IMKgwqDCoCAuLi4KPiB9
Owo+Cj4gZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2Vlc2F3X2J1dHRvbnNfbmV3KTsgaSsr
KSB7Cj4gwqDCoMKgIHNwYXJzZV9rZXltYXBfcmVwb3J0X2VudHJ5KGlucHV0LCAmc2Vlc2F3X2J1
dHRvbnNfbmV3W2ldLAo+IMKgwqDCoMKgwqDCoMKgIGRhdGEuYnV0dG9uX3N0YXRlICYgQklUKHNl
ZXNhd19idXR0b25zX25ld1tpXS5jb2RlKSwKPiDCoMKgwqDCoMKgwqDCoCBmYWxzZSk7Cj4gfQo+
Cj4gSSBkb24ndCB0aGluayB0aGlzIHNpZ25pZmljYW50bHkgaW1wcm92ZXMgdGhlIGNvZGUgdW5s
ZXNzIHlvdSBoYWQgc29tZQo+IG90aGVyIHdheSB0byB1c2UgdGhlIEFQSSBpbiBtaW5kLgoKSSB0
aG91Z2h0IGFib3V0IHNwYXJzZV9rZXltYXBfc2V0dXAoKSBhbmQgc3BhcnNlX2tleW1hcF9yZXBv
cnRfZXZlbnQoKS4KCkl0IGRvZXMgbm90IHNpZ25pZmljYW50bHkgY2hhbmdlIHRoZSBjb2RlIGJ1
dCB3b3VsZCBiZSBhIHN0YW5kYXJkIEFQSS4KClRob21hcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
