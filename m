Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C55E743EE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 07:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A97F040A44;
	Fri, 29 Sep 2023 07:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97F040A44
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=jABpx6pj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJcoHNFF-hv2; Fri, 29 Sep 2023 07:39:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 859F540122;
	Fri, 29 Sep 2023 07:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859F540122
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51722C0039;
	Fri, 29 Sep 2023 07:39:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91BEAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA4B60B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA4B60B3F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com
 header.a=rsa-sha256 header.s=mailo header.b=jABpx6pj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Pti4RCxBm1l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:39:33 +0000 (UTC)
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E990860B25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E990860B25
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1695973158; bh=jCXpnkD65gBL82o/dmwBwRzPh1cMJECkbSyB2ZedaOU=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=jABpx6pjJbOoRCTDeUAFVzC32vkF7Vx+lrp3RpxHCCCs27wAfLOHe7CsRqNuCQsKU
 uigTJYElqBhY6h+BV/nPzkwRzA5PPkAcpejkvMA6T+SsAY+BBMW/9hPhiD7LCCsYPw
 b+as3MUdyGCG6iSJExvT9kThbGvGssJlG0Jem1Cc=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri, 29 Sep 2023 09:39:17 +0200 (CEST)
X-EA-Auth: UlFkxK2sLNWRc9kMuK0MPizk6AYjvh9OiodH7TWZlBB6qMjIFdaikrp+ZyO5wfQccBmhJTUB1GHw/xXmuVpNPcUu6AVPBw/f
Message-ID: <0c1ed836c5a306331e1b2a97217c3c9f7e1fb701.camel@mailo.com>
Subject: Re: [PATCH] gfs2: fix 'passing zero to ERR_PTR()' warning
From: drv <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Fri, 29 Sep 2023 13:09:11 +0530
In-Reply-To: <a2d702b0-e819-47b0-a945-c2e38a162381@kadam.mountain>
References: <ZRXA7n0wD83zhPxC@runicha.com>
 <a2d702b0-e819-47b0-a945-c2e38a162381@kadam.mountain>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, Bob Peterson <rpeterso@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <error27@gmail.com>
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

T24gRnJpLCAyMDIzLTA5LTI5IGF0IDEwOjA2ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IE9uIFRodSwgU2VwIDI4LCAyMDIzIGF0IDExOjM3OjQyUE0gKzA1MzAsIERlZXBhayBSIFZhcm1h
IHdyb3RlOgo+ID4gUmVzb2x2ZSB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3
YXJuaW5nOgo+ID4gwqDCoMKgwqDCoMKgwqDCoGZzL2dmczIvYWNsLmM6NTQgX19nZnMyX2dldF9h
Y2woKSB3YXJuOiBwYXNzaW5nIHplcm8gdG8KPiA+ICdFUlJfUFRSJwo+ID4gCj4gPiBieSByZXR1
cm5pbmcgTlVMTCB3aGVuIGFuIGV4dGVuZGVkIGF0dHJpYnV0ZSBsZW5ndGggaXMgemVybywKPiA+
IGluc3RlYWQgb2YKPiA+IHBhc3Npbmcgb24gemVybyB0byB0aGUgRVJSX1BUUigpLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUiBWYXJtYSA8ZHJ2QG1haWxvLmNvbT4KPiA+IC0tLQo+
IAo+IFBhc3NpbmcgemVybyB0byBFUlJfUFRSKCkgaXMgbm90IGEgYnVnLgo+IAo+IFlvdSdyZSBw
YXRjaCBkb2Vzbid0IGNoYW5nZSBob3cgdGhlIGNvZGUgd29ya3MgYXQgYWxsLCByaWdodD/CoCBT
bwo+IGl0J3MKPiBsaWtlIGEgY2xlYW51cCBwYXRjaC7CoCBCdXQgdGhlIGNvZGUgd2FzIG5pY2Vy
IGluIHRoZSBvcmlnaW5hbC4KPiAKPiBUaGlzIGlzIGp1c3QgYSBmYWxzZSBwb3NpdGl2ZS7CoCBJ
Z25vcmUgc3RhdGljIGNoZWNrZXIgZmFsc2UKPiBwb3NpdGl2ZXMuCj4gRml4IHRoZSBjaGVja2Vy
IGluc3RlYWQuwqAgQWx0aG91Z2ggaW4gdGhpcyBjYXNlLCBJIGNhbid0IHRoaW5rIG9mIGFuCj4g
ZWFzeSB3YXkgZml4IHRoZSBjaGVja2VyLsKgIFBlcmhhcHMgZG9uJ3QgcHJpbnQgYSB3YXJuaW5n
IGlmIHRoZQo+IGNhbGxlcnMKPiBjaGVjayBmb3IgTlVMTD8KPiAKPiBUaGUgcGFzc2luZyB6ZXJv
IHRvIEVSUl9QVFIoKSB3YXJuaW5nIGlzIGFjdHVhbGx5IGEgcHJldHR5IGdvb2QKPiBoZXVyaXN0
aWMuwqAgOTAlIG9mIHRoZSB0aW1lIGluIG5ldyBjb2RlIHRoaXMgaXMgYSByZWFsIGJ1Zy7CoCBC
dXQgaW4KPiBvbGQKPiBjb2RlIHRoZW4gcHJvYmFibHkgaXQncyAwJSByZWFsIGJ1Z3MgYmVjYXVz
ZSB3ZSd2ZSBiZWVuIHJldmlld2luZwo+IHRoZXNlCj4gd2FybmluZ3MgZm9yIG92ZXIgYSBkZWNh
ZGUuCj4gCj4gSSBoYXZlIGEgYmxvZyB3aGljaCBtaWdodCBiZSB1c2VmdWwuCj4gaHR0cHM6Ly9z
dGF0aWN0aGlua2luZy53b3JkcHJlc3MuY29tLzIwMjIvMDgvMDEvbWl4aW5nLWVycm9yLXBvaW50
ZXJzLWFuZC1udWxsLwo+IAo+IFdoZW4gSSdtIHJldmlld2luZyB0aGlzIHBhdGNoIEkgdGhpbms6
Cj4gMSkgRG9lcyBnZnMyX3hhdHRyX2FjbF9nZXQoKSByZXR1cm4gemVybz/CoCBBbmQgaXQgZG9l
cy4KPiAyKSBEb2VzIHRoYXQgbG9vayBpbnRlbnRpb25hbC7CoCBJdCdzIGhhcmRlciB0byB0ZWxs
IGJlY2F1c2UgdGhlcmUKPiBhcmVuJ3QKPiDCoMKgIGNvbW1lbnRzIGFuZCBpdCBsb29rcyBsaWtl
IGl0IG1pZ2h0IGJlIGEgbWlzc2luZyBlcnJvciBjb2RlLsKgIEJ1dAo+IMKgwqAgd2hlbiB5b3Ug
cmVhZCBpdCBjbG9zZWx5IHRoZW4gYWN0dWFsbHkgaXQgZG9lcyBsb29rIGludGVudGlvbmFsLgo+
IMKgwqAgSW4gdGVybXMgb2YgU21hdGNoLCBJIGNvbnNpZGVyIGl0ICJpbnRlbnRpb25hbCIgaWYg
dGhlcmUgaXMgYW4KPiDCoMKgICJlcnJvciA9IDA7IiB3aXRoaW4gNSBsaW5lcyBmb3IgdGhlIGdv
dG8uwqAgKE90aGVyIGxhbmd1YWdlcyBsaWtlCj4gUnVzdAo+IMKgwqAgYXJlIGJldHRlciB0aGFu
IEMgYmVjYXVzZSB0aGV5IGZvcmNlIGV2ZXJ5b25lIHRvIGZvbGxvdyB0aGUgcnVsZXMuCj4gwqDC
oCAjdHJvbGxpbmcpLgo+IDMpIERvIHRoZSBjYWxsZXJzIG9mIF9fZ2ZzMl9nZXRfYWNsKCkgY2hl
Y2sgZm9yIE5VTEwgYW5kIHRoZXkgZG8uCj4gCj4gU28gdGhpcyBjb2RlIGlzIGZpbmUuCj4gCj4g
SSBob3BlIHRoaXMgaGVscHMgeW91IGluIHlvdXIgcmV2aWV3IHByb2Nlc3MuwqAgMSnCoCBJZ25v
cmUgb2xkCj4gd2FybmluZ3MuCj4gMinCoCBJZ25vcmUgZmFsc2UgcG9zaXRpdmVzLsKgIDMpwqAg
SWYgeW91IHRoaW5rIGl0IGlzIGEgYnVnLCB0aGVuIHRyeQo+IHRvCj4gZmlndXJlIG91dCBob3cg
aXQgd2lsbCBjYXVzZSBhIGNyYXNoLsKgIExvb2sgYXQgdGhlIGNhbGxlciBldGMuCj4gCkhpIERh
biwKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LCBmZWVkYmFjayBhbmQgZ3VpZGFuY2UuIFRoaXMg
aXMgcmVhbGx5CmhlbHBmdWwuCgpyZWdhcmRzLApkZWVwYWsuCgo+IHJlZ2FyZHMsCj4gZGFuIGNh
cnBlbnRlcgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
