Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CB7C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 17:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D47604DC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 17:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78D47604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B814021F;
	Wed, 13 Oct 2021 17:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkp8oViYBhha; Wed, 13 Oct 2021 17:59:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0635D40155;
	Wed, 13 Oct 2021 17:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D20C0C0011;
	Wed, 13 Oct 2021 17:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6B83C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E91608F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mIqzXTErfJZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:59:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA62608ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:59:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E82604DC;
 Wed, 13 Oct 2021 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634147971;
 bh=lq9t+NEWwYUY1eCnpZoa1nDuyeDLIStz5FujbA0LBgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GrpJudMP2+EFqVYwSMHxgaoAxHB5Jo95mZD8RoRhZvbJS+z3+dDVZv4wFuYjpy5gw
 nXdrkx3ourKU9P7o+T1UMj9SZOk/JRNsErwDR/JBrEE6HUVKPGCV1pOOY4L+wNDfcQ
 GjBEpEXzhg2++9HmYtQmka9Key5WLk5rTDDjBgsfCVsJ+yiWlzIPhqdFM1ykCAIh5V
 k0srhDXySuGSYLLs1XoyljLZGS5PWSaQ4STsWShe4eub49+MU2JoGGfGozUAcz9+0n
 LjmBqvtYq9eLOA64z2q3fHUhDuFTT5ztaikI002pCIkfJ1Y2ennO0Oqeg8cYtQkyrJ
 aWy84a//HcZMg==
Received: by pali.im (Postfix)
 id 1F5777FF; Wed, 13 Oct 2021 19:59:29 +0200 (CEST)
Date: Wed, 13 Oct 2021 19:59:28 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211013175928.3sqnvrv7qc727uja@pali>
References: <20211012155928.3nuyzgrgvyjm2v3r@theprophet>
 <20211013021310.GA1864069@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013021310.GA1864069@bhelgaas>
User-Agent: NeoMutt/20180716
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCI DRIVER FOR AARDVARK \(Marvell Armada 3700\)"
 <linux-arm-kernel@lists.infradead.org>
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

T24gVHVlc2RheSAxMiBPY3RvYmVyIDIwMjEgMjE6MTM6MTAgQmpvcm4gSGVsZ2FhcyB3cm90ZToK
PiBPbiBUdWUsIE9jdCAxMiwgMjAyMSBhdCAwOToyOToyOFBNICswNTMwLCBOYXZlZW4gTmFpZHUg
d3JvdGU6Cj4gPiBPbiAxMS8xMCwgUGFsaSBSb2jDoXIgd3JvdGU6Cj4gPiA+IE9uIE1vbmRheSAx
MSBPY3RvYmVyIDIwMjEgMjM6NTU6MzUgTmF2ZWVuIE5haWR1IHdyb3RlOgo+ID4gPiA+IE9uIDEx
LzEwLCBQYWxpIFJvaMOhciB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbmRheSAxMSBPY3RvYmVyIDIw
MjEgMjM6MjY6MzMgTmF2ZWVuIE5haWR1IHdyb3RlOgo+ID4gPiA+ID4gPiBBbiBNTUlPIHJlYWQg
ZnJvbSBhIFBDSSBkZXZpY2UgdGhhdCBkb2Vzbid0IGV4aXN0IG9yIGRvZXNuJ3QgcmVzcG9uZAo+
ID4gPiA+ID4gPiBjYXVzZXMgYSBQQ0kgZXJyb3IuICBUaGVyZSdzIG5vIHJlYWwgZGF0YSB0byBy
ZXR1cm4gdG8gc2F0aXNmeSB0aGUKPiA+ID4gPiA+ID4gQ1BVIHJlYWQsIHNvIG1vc3QgaGFyZHdh
cmUgZmFicmljYXRlcyB+MCBkYXRhLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVXNlIFNFVF9Q
Q0lfRVJST1JfUkVTUE9OU0UoKSB0byBzZXQgdGhlIGVycm9yIHJlc3BvbnNlLCB3aGVuIGEgZmF1
bHR5Cj4gPiA+ID4gPiA+IHJlYWQgb2NjdXJzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhp
cyBoZWxwcyB1bmlmeSBQQ0kgZXJyb3IgcmVzcG9uc2UgY2hlY2tpbmcgYW5kIG1ha2UgZXJyb3Ig
Y2hlY2sKPiA+ID4gPiA+ID4gY29uc2lzdGVudCBhbmQgZWFzaWVyIHRvIGZpbmQuCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBDb21waWxlIHRlc3RlZCBvbmx5Lgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIE5haWR1IDxuYXZlZW5uYWlkdTQ3OUBnbWFpbC5j
b20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktYWFyZHZhcmsuYyB8IDggKysrKy0tLS0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLWFhcmR2YXJrLmMKPiA+ID4gPiA+ID4gaW5kZXggNTk2ZWJj
ZmNjODJkLi5kYzJmODIwZWY1NWYgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpLWFhcmR2YXJrLmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9wY2ktYWFyZHZhcmsuYwo+ID4gPiA+ID4gPiBAQCAtODk0LDcgKzg5NCw3IEBA
IHN0YXRpYyBpbnQgYWR2a19wY2llX3JkX2NvbmYoc3RydWN0IHBjaV9idXMgKmJ1cywgdTMyIGRl
dmZuLAo+ID4gPiA+ID4gPiAgCWludCByZXQ7Cj4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gIAlp
ZiAoIWFkdmtfcGNpZV92YWxpZF9kZXZpY2UocGNpZSwgYnVzLCBkZXZmbikpIHsKPiA+ID4gPiA+
ID4gLQkJKnZhbCA9IDB4ZmZmZmZmZmY7Cj4gPiA+ID4gPiA+ICsJCVNFVF9QQ0lfRVJST1JfUkVT
UE9OU0UodmFsKTsKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSGVsbG8hIE5vdyBJJ20gbG9va2luZyBh
dCB0aGlzIG1hY3JvLCBhbmQgc2hvdWxkIG5vdCBpdCBkZXBlbmRzIG9uCj4gPiA+ID4gPiAic2l6
ZSIgYXJndW1lbnQ/IElmIGRvaW5nIDgtYml0IG9yIDE2LWJpdCByZWFkIG9wZXJhdGlvbiB0aGVu
IHNob3VsZCBub3QKPiA+ID4gPiA+IGl0IHJhdGhlciBzZXRzIG9ubHkgbG93IDggYml0cyBvciBs
b3cgMTYgYml0cyB0byBvbmVzPwo+IAo+ID4gPiBGdW5jdGlvbiBpdHNlbGYgaXMgZGVjbGFyZWQg
YXM6Cj4gPiA+IAo+ID4gPiBzdGF0aWMgaW50IGFkdmtfcGNpZV9yZF9jb25mKHN0cnVjdCBwY2lf
YnVzICpidXMsIHUzMiBkZXZmbiwgaW50IHdoZXJlLCBpbnQgc2l6ZSwgdTMyICp2YWwpOwo+ID4g
PiAKPiA+ID4gQW5kIGluICJzaXplIiBhcmd1bWVudCBpcyBzdG9yZWQgbnVtYmVyIG9mIGJ5dGVz
LCBraW5kIG9mIHJlYWQgb3BlcmF0aW9uCj4gPiA+IChyZWFkIGJ5dGUsIHJlYWQgd29yZCwgcmVh
ZCBkd29yZCkuIEluICp2YWwgaXMgdGhlbiBzdG9yZWQgcmVhZCB2YWx1ZS4KPiA+ID4gRm9yIGJ5
dGUgb3BlcmF0aW9uLCBqdXN0IGxvdyA4IGJpdHMgaW4gKnZhbCB2YXJpYWJsZSBhcmUgc2V0Lgo+
ID4gPiAKPiA+ID4gQmVjYXVzZSAqdmFsIGlzIHUzMiBpdCBtZWFucyB0aGF0IHR5cGVvZigqdmFs
KSBpcyBhbHdheXMgNCBpbmRlcGVuZGVudGx5Cj4gPiA+IG9mIHRoZSAic2l6ZSIgYXJndW1lbnQu
Cj4gPiA+IAo+ID4gPiBGb3IgZXhhbXBsZSBvdGhlciBwcm9qZWN0IFUtQm9vdCBoYXMgYWxzbyBw
Y2ktYWFyZHZhcmsuYyBkcml2ZXIgYW5kCj4gPiA+IFUtQm9vdCBoYXMgZm9yIChwcm9iYWJseSBz
YW1lKSBwdXJwb3NlIHBjaV9nZXRfZmYoKSBtYWNybywgc2VlOgo+ID4gPiBodHRwczovL3NvdXJj
ZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL3YyMDIxLjEwL2RyaXZlcnMvcGNpL3BjaS1h
YXJkdmFyay5jI0wzNjcKPiA+ID4gCj4gPiA+IEknbSBub3Qgc2F5aW5nIGlmIGN1cnJlbnQgYXBw
cm9hY2ggdG8gYWx3YXlzIHNldHMgMHhmZmZmZmZmZgo+ID4gPiAoaW5kZXBlbmRlbnRseSBvZiAi
c2l6ZSIgYXJndW1lbnQpIGlzIGNvcnJlY3Qgb3Igbm90IGFzIEkgZG8gbm90IGtub3cKPiA+ID4g
aXQgdG9vISBJJ20ganVzdCBnaXZpbmcgZXhhbXBsZSB0aGF0IHRoaXMgUENJIGNvZGUgaGFzIHZl
cnkgc2ltaWxhcgo+ID4gPiBpbXBsZW1lbnRhdGlvbiBvZiBvdGhlciBwcm9qZWN0IChVLUJvb3Qp
IHdoaWNoIHNldHMgbnVtYmVyIG9mIG9uZXMgYmFzZWQKPiA+ID4gb24gdGhlIHNpemUgYXJndW1l
bnQuCj4gCj4gSSBkb24ndCB0aGluayB0aGVyZSdzIGFuIGlzc3VlIGhlcmUuICBhZHZrX3BjaWVf
cmRfY29uZigpIGNhbiBzZXQgdGhlCj4gd2hvbGUgdTMyIHRvIDB4ZmZmZmZmZmYgcmVnYXJkbGVz
cyBvZiB0aGUgInNpemUiIHZhbHVlIGJlY2F1c2UKPiBwY2lfYnVzX3JlYWRfY29uZmlnX2J5dGUo
KSBhbmQgcGNpX2J1c19yZWFkX2NvbmZpZ193b3JkKCkgZXh0cmFjdCBvdXQKPiB0aGUgcGFydCB0
aGV5IG5lZWQ6Cj4gCj4gICByZXMgPSBidXMtPm9wcy0+cmVhZChidXMsIGRldmZuLCBwb3MsIGxl
biwgJmRhdGEpOyAgICAgICAgICAgICAgXAo+ICAgKnZhbHVlID0gKHR5cGUpZGF0YTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiB3aGVyZSAidHlwZSIg
aXMgdTggb3IgdTE2ICh0aGlzIGlzIGhhcmQgdG8gZ3JlcCBmb3I7IGl0J3MgaW4gdGhlCj4gUENJ
X09QX1JFQUQoKSBtYWNybyBpbiBkcml2ZXJzL3BjaS9hY2Nlc3MuYykuCgpPayEgTm8gcHJvYmxl
bSBpZiB0aGlzIGlzIHNvbWV0aGluZyB3aGljaCBpcyBub3QgZ29pbmcgdG8gYmUgY2hhbmdlZC4K
Cj4gPiBJIGFtIG5vdCBzdXJlIHRvbywgaWYgd2Ugd291bGQgbGlrZSB0byBoYXZlIHNvbWV0aGlu
ZyBsaWtlIHBjaV9nZXRfZmYoKQo+ID4gd2hpY2ggc2V0cyB0aGUgcmV0dXJuIG1hc2sgYmFzZWQg
b24gdGhlIHNpemUuCj4gCj4gSSdkIGxpa2UgdG8gc2VlIGhvdyBwY2lfZ2V0X2ZmKCkgd29ya3Mg
YmVjYXVzZSB0aGlzIGlzIHBvdGVudGlhbGx5IGEKPiB3aWRlc3ByZWFkLCBpbnZhc2l2ZSBjaGFu
Z2UgYW5kIGl0J3MgYWx3YXlzIGJldHRlciB0byBjb3B5IGEgZ29vZAo+IGV4aXN0aW5nIGRlc2ln
biB0aGFuIHRvIG1ha2UgdXAgc29tZXRoaW5nIG5ldy4KCkhlcmUgaXMgVS1Cb290IGltcGxlbWVu
dGF0aW9uIG9mIHRoYXQgZnVuY3Rpb24sIGl0IGlzIHByZXR0eSBzaW1wbGU6Cmh0dHBzOi8vc291
cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjEuMTAvZHJpdmVycy9wY2kvcGNp
LXVjbGFzcy5jI0wxMDMtMTEzCgo+ID4gPiBBbnl3YXksIEkgdmVyeSBsaWtlIHRoaXMgeW91ciBp
ZGVhIHRvIGhhdmUgYSBtYWNybyB3aGljaCBwdXJwb3NlIGlzIHRvCj4gPiA+IGV4cGxpY2l0bHkg
aW5kaWNhdGUgZXJyb3IgZHVyaW5nIGNvbmZpZyByZWFkIG9wZXJhdGlvbiEgQW5kIHRvIHVuaWZ5
IGFsbAo+ID4gPiBkcml2ZXJzIHRvIHVzZSBzYW1lIHN0eWxlIGZvciBzaWduYWxsaW5nIGNvbmZp
ZyByZWFkIGVycm9yLgo+IAo+IEkgZGVmaW5pdGVseSB0aGluayB0aGVyZSdzIGEgbG90IG9mIHZh
bHVlIGluIG1ha2luZyB0aGlzIGNvbnNpc3RlbnQKPiAqc29tZWhvdyosIHNvIHRoYW5rcyBmb3Ig
d29ya2luZyBvbiB0aGlzIQoKKzEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
