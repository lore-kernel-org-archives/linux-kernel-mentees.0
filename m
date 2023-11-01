Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C2C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 08:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B97B743015;
	Wed,  1 Nov 2023 08:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97B743015
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=O/NmY7tT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCDH4AoJGw_a; Wed,  1 Nov 2023 08:45:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0475440108;
	Wed,  1 Nov 2023 08:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0475440108
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0CC3C0039;
	Wed,  1 Nov 2023 08:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16A71C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 08:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D41C04D4E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 08:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41C04D4E0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de
 header.a=rsa-sha256 header.s=mail header.b=O/NmY7tT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaaSPEQD1eWG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 08:45:24 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47261409F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 08:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47261409F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1698828315; bh=dUn69NpLHm95YlSQflbcp4YFtXVEb5UF3XD5Lg1d5gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/NmY7tTzxPyPRa6lTNocgFIqOJjvGDfR88RyqlmXkdEZ7KnUY4FVhnBV3jXO8kEI
 M2K26fSQ1MFk/XD4lCApNP3GBO+iQMfsLYdH+097QrWsdV0BaKT/kvH3dglzSYgE7e
 +x288rUcOvxWX4XNS3TIhOxl1Pwtol6ggbdpS4rA=
Date: Wed, 1 Nov 2023 09:45:14 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Anshul Dalal <anshulusr@gmail.com>
Subject: Re: [PATCH v6 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Message-ID: <2241e06f-ef90-4299-97cd-cfb8fd569065@t-8ch.de>
References: <20231027051819.81333-1-anshulusr@gmail.com>
 <20231027051819.81333-2-anshulusr@gmail.com>
 <d1dd2142-546f-42b7-8966-ab75fd4f8817@t-8ch.de>
 <efea5ae2-7e41-4b78-a283-1f907be560b0@gmail.com>
 <9c9f6171-f879-46f5-81d2-6764257a49eb@t-8ch.de>
 <152d15c4-10bb-45fe-9b9c-b323535a921f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <152d15c4-10bb-45fe-9b9c-b323535a921f@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
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

SGkgQW5zaHVsLAoKT24gMjAyMy0xMS0wMSAwOTo1MDozNiswNTMwLCBBbnNodWwgRGFsYWwgd3Jv
dGU6Cj4gT24gMTAvMzEvMjMgMDc6NTMsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+ID4gT2N0
IDMxLCAyMDIzIDAzOjEwOjUwIEFuc2h1bCBEYWxhbCA8YW5zaHVsdXNyQGdtYWlsLmNvbT46Cj4g
Pj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBUaGUgcmVxdWVzdGVkIGNoYW5nZXMgd2lsbCBiZSBh
ZGRyZXNzZWQgaW4gdGhlCj4gPj4gbmV4dCBwYXRjaCB2ZXJzaW9uIHRob3VnaCBJIGhhZCBhIGZl
dyBjb21tZW50cyBiZWxvdzoKPiA+Pgo+ID4+IE9uIDEwLzI3LzIzIDExOjQ0LCBUaG9tYXMgV2Vp
w59zY2h1aCB3cm90ZToKPiA+Pj4gSGkgQW5zaHVsLAo+ID4+Pgo+ID4+PiB0aGFua3MgZm9yIHRo
ZSByZXdvcmtzIQo+ID4+Pgo+ID4+PiBTb21lIG1vcmUgY29tbWVudHMgaW5saW5lLgo+ID4+Pgo+
ID4+PiBPbiAyMDIzLTEwLTI3IDEwOjQ4OjExKzA1MzAsIEFuc2h1bCBEYWxhbCB3cm90ZToKPiA+
IAo+ID4gWy4uXQo+ID4gCj4gPj4+PiArc3RydWN0IHNlZXNhd19idXR0b25fZGVzY3JpcHRpb24g
ewo+ID4+Pj4gK8KgwqAgdW5zaWduZWQgaW50IGNvZGU7Cj4gPj4+PiArwqDCoCB1bnNpZ25lZCBp
bnQgYml0Owo+ID4+Pj4gK307Cj4gPj4+PiArCj4gPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBz
ZWVzYXdfYnV0dG9uX2Rlc2NyaXB0aW9uIHNlZXNhd19idXR0b25zW10gPSB7Cj4gPj4+PiArwqDC
oCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX0VBU1QsCj4gPj4+PiArwqDCoMKg
wqDCoMKgIC5iaXQgPSBTRUVTQVdfQlVUVE9OX0EsCj4gPj4+PiArwqDCoCB9LAo+ID4+Pj4gK8Kg
wqAgewo+ID4+Pj4gK8KgwqDCoMKgwqDCoCAuY29kZSA9IEJUTl9TT1VUSCwKPiA+Pj4+ICvCoMKg
wqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fQiwKPiA+Pj4+ICvCoMKgIH0sCj4gPj4+PiAr
wqDCoCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX05PUlRILAo+ID4+Pj4gK8Kg
wqDCoMKgwqDCoCAuYml0ID0gU0VFU0FXX0JVVFRPTl9YLAo+ID4+Pj4gK8KgwqAgfSwKPiA+Pj4+
ICvCoMKgIHsKPiA+Pj4+ICvCoMKgwqDCoMKgwqAgLmNvZGUgPSBCVE5fV0VTVCwKPiA+Pj4+ICvC
oMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fWSwKPiA+Pj4+ICvCoMKgIH0sCj4gPj4+
PiArwqDCoCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX1NUQVJULAo+ID4+Pj4g
K8KgwqDCoMKgwqDCoCAuYml0ID0gU0VFU0FXX0JVVFRPTl9TVEFSVCwKPiA+Pj4+ICvCoMKgIH0s
Cj4gPj4+PiArwqDCoCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX1NFTEVDVCwK
PiA+Pj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fU0VMRUNULAo+ID4+Pj4g
K8KgwqAgfSwKPiA+Pj4+ICt9Owo+ID4+Pgo+ID4+PiBUaGlzIGxvb2tzIHZlcnkgbXVjaCBsaWtl
IGEgc3BhcnNlIGtleW1hcCB3aGljaCBjYW4gYmUgaW1wbGVtZW50ZWQgd2l0aAo+ID4+PiB0aGUg
aGVscGVycyBmcm9tIDxsaW51eC9pbnB1dC9zcGFyc2Uta2V5bWFwLmg+Lgo+ID4+Pgo+ID4+Cj4g
Pj4gV2hlbiBnb2luZyB0aHJvdWdoIHRoZSBBUEkgcHJvdmlkZWQgYnkgc3BhcnNlLWtleW1hcCwg
SSBjb3VsZCBvbmx5IHNlZQo+ID4+IHRoZSB1c2UgZm9yIHNwYXJzZV9rZXltYXBfcmVwb3J0X2Vu
dHJ5IGhlcmUuIFdoaWNoIGxlYWRzIHRvIHRoZQo+ID4+IGZvbGxvd2luZyByZWZhY3RvcmVkIGNv
ZGU6Cj4gPj4KPiA+PiBzdGF0aWMgY29uc3Qgc3RydWN0IGtleV9lbnRyeSBzZWVzYXdfYnV0dG9u
c19uZXdbXSA9IHsKPiA+PiDCoMKgwqAge0tFX0tFWSwgU0VFU0FXX0JVVFRPTl9BLCB7QlROX1NP
VVRIfX0sCj4gPj4gwqDCoMKgIHtLRV9LRVksIFNFRVNBV19CVVRUT05fQiwge0JUTl9FQVNUfX0s
Cj4gPiAKPiA+IE5vIGJyYWNlcyBJIHRoaW5rLgo+ID4gCj4gCj4gU2luY2UgdGhlIGxhc3QgZmll
bGQgaW4ga2V5X2VudHJ5IGlzIGEgdW5pb24sIHRoZSBicmFjZXMgc2VlbSB0byBiZQo+IHJlcXVp
cmVkLgoKSW5kZWVkLgoKVG8gbWFrZSB0aGUgdW5pb24gbW9yZSB2aXNpYmxlIGV4cGxpY2l0IHRo
aXMgY291bGQgYmUgZG9uZToKCnsgS0VfS0VZLCBTRUVTQVdfQlVUVE9OX0EsIC5rZXljb2RlID0g
QlROX1NPVVRIIH0KCj4gCj4gPj4gwqDCoMKgIC4uLgo+ID4+IH07Cj4gPj4KPiA+PiBmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShzZWVzYXdfYnV0dG9uc19uZXcpOyBpKyspIHsKPiA+PiDCoMKg
wqAgc3BhcnNlX2tleW1hcF9yZXBvcnRfZW50cnkoaW5wdXQsICZzZWVzYXdfYnV0dG9uc19uZXdb
aV0sCj4gPj4gwqDCoMKgwqDCoMKgwqAgZGF0YS5idXR0b25fc3RhdGUgJiBCSVQoc2Vlc2F3X2J1
dHRvbnNfbmV3W2ldLmNvZGUpLAo+ID4+IMKgwqDCoMKgwqDCoMKgIGZhbHNlKTsKPiA+PiB9Cj4g
Pj4KPiA+PiBJIGRvbid0IHRoaW5rIHRoaXMgc2lnbmlmaWNhbnRseSBpbXByb3ZlcyB0aGUgY29k
ZSB1bmxlc3MgeW91IGhhZCBzb21lCj4gPj4gb3RoZXIgd2F5IHRvIHVzZSB0aGUgQVBJIGluIG1p
bmQuCj4gPiAKPiA+IEkgdGhvdWdodCBhYm91dCBzcGFyc2Vfa2V5bWFwX3NldHVwKCkgYW5kIHNw
YXJzZV9rZXltYXBfcmVwb3J0X2V2ZW50KCkuCj4gPiAKPiA+IEl0IGRvZXMgbm90IHNpZ25pZmlj
YW50bHkgY2hhbmdlIHRoZSBjb2RlIGJ1dCB3b3VsZCBiZSBhIHN0YW5kYXJkIEFQSS4KPiA+IAo+
IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgZG8geW91
IHRoaW5rIHRoZQo+IGZvbGxvd2luZyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgQVBJIGlzIGFjY2Vw
dGFibGUgZm9yIHRoZSBkcml2ZXIuIFNpbmNlCj4gSSBjb3VsZG4ndCBmaW5kIGEgZHJpdmVyIGZv
ciBhbnkgc2ltaWxhciBkZXZpY2UgdXNpbmcgdGhlIEFQSSBpbiB0aGlzCj4gbWFubmVyLgo+IAo+
IGluc2lkZSBzZWVzYXdfcHJvYmUoKToKPiAKPiBlcnIgPSBzcGFyc2Vfa2V5bWFwX3NldHVwKHNl
ZXNhdy0+aW5wdXRfZGV2LCBzZWVzYXdfYnV0dG9uc19uZXcsIE5VTEwpOwo+IGlmIChlcnIpIHsK
PiAJZGV2X2VycigmY2xpZW50LT5kZXYsCj4gCQkiZmFpbGVkIHRvIHNldCB1cCBpbnB1dCBkZXZp
Y2Uga2V5bWFwOiAlZFxuIiwgZXJyKTsKPiAJcmV0dXJuIGVycjsKPiB9CgpZZXMsIGFuZCBpdCBy
ZXBsYWNlcyB0aGUgY2FsbHMgdG8gaW5wdXRfc2V0X2NhcGFiaWxpdHkoKS4KCj4gaW5zaWRlIHNl
ZXNhd19wb2xsKCk6Cj4gCj4gZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2Vlc2F3X2J1dHRv
bnNfbmV3KTsgaSsrKSB7Cj4gCWlmICghc3BhcnNlX2tleW1hcF9yZXBvcnRfZXZlbnQoCj4gCQlp
bnB1dCwgc2Vlc2F3X2J1dHRvbnNfbmV3W2ldLmNvZGUsCj4gCQlkYXRhLmJ1dHRvbl9zdGF0ZSAm
IEJJVChzZWVzYXdfYnV0dG9uc19uZXdbaV0uY29kZSksCj4gCQlmYWxzZSkpIHsKPiAJCWRldl9l
cnJfcmF0ZWxpbWl0ZWQoCj4gCQkJJmlucHV0LT5kZXYsCj4gCQkJImZhaWxlZCB0byByZXBvcnQg
ZXZlbnQgZm9yIGtleWNvZGU6ICVkIiwKPiAJCQlzZWVzYXdfYnV0dG9uc19uZXdbaV0ua2V5Y29k
ZSk7Cj4gCQlyZXR1cm47Cj4gCX0KPiB9Cgpmb3JfZWFjaF9zZXRfYml0KGksIChsb25nICopJlNF
RVNBV19CVVRUT05fTUFTSywgQklUU19QRVJfVFlQRShTRUVTQVdfQlVUVE9OX01BU0spKQoJc3Bh
cnNlX2tleW1hcF9yZXBvcnRfZXZlbnQoaW5wdXQsIEJJVChpKSwgZGF0YS5idXR0b25fc3RhdGUg
JiBCSVQoaSksIGZhbHNlKTsKClRoZSBzcGFyc2Uga2V5bWFwIHRha2VzIGNhcmUgb2YgdGhlIHRy
YW5zbGF0aW9uLgoKCk5vdGVzOgoKU0VFU0FXX0JVVFRPTl9NQVNLIGlzIG5vdyBhbiBhY3R1YWwg
dmFyaWFibGUgaW5zdGVhZCBvZiBhIG1hY3JvLgpJdCBzaG91bGQgYmUgJ3N0YXRpYyBjb25zdCcg
aW4gdGhhdCBjYXNlLgoKV2hlbiB1c2luZyB0aGUgc3BhcnNlIGtleW1hcCBBUElzIHRoZSBkcml2
ZXIgYWxzbyBuZWVkcyB0byBkZXBlbmQgb24KSU5QVVRfU1BBUlNFS01BUC4KCgpUaG9tYXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVs
LW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
