Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAC1C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38A561076
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D38A561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A64AA608BA;
	Mon, 11 Oct 2021 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMA3tHvEoosu; Mon, 11 Oct 2021 18:41:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AF4DA608B7;
	Mon, 11 Oct 2021 18:41:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 997DEC0011;
	Mon, 11 Oct 2021 18:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E557FC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D34034049D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZxCPO59Fgv6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B1854049B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:41:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A37F60EB1;
 Mon, 11 Oct 2021 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633977707;
 bh=OUpsvaa2Ww8kOdRdhRMnEsW/y3JxO0MjIcQCoVLgCz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASGTHeGvamJWUEwSAeRjQDib2OtvfxkhIFCDCwT5tnO2iFyGAoiMCJFQtqRkE0eG8
 dpmHYWzcNuADcklKZPise08Y0u7QIlVOy2c/3Ri7yj6XIAAlg6OyikBlYNYC5BLyOG
 PLazxCWmheZqDqaL/TKGcBOlJRA0JWDG8Ujmd2+RMR8O9goVoNsoxV2GZ4q8UgDOHp
 /lmRda7U4NHhiwMkcChPALtVMFxGTLs+cBOFUhXfQif4KZrEptMlklYraHbIzEhEjT
 mKey+azEelJu+Dx7KPpl/7vF8QP7MYStdPRDoT9vv1PRuLzKE8O7k0BPO7+P5g6Fgc
 EnwlapTByzZBw==
Received: by pali.im (Postfix)
 id 04A9A7C9; Mon, 11 Oct 2021 20:41:44 +0200 (CEST)
Date: Mon, 11 Oct 2021 20:41:44 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211011184144.qcbmif7hvzozdgzw@pali>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <f423dc9cc90e345680d289d5df7ff469e9b89c60.1633972263.git.naveennaidu479@gmail.com>
 <20211011180850.hgp4ctykvus37fx7@pali>
 <20211011182526.kboaxqofdpd2jjrl@theprophet>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011182526.kboaxqofdpd2jjrl@theprophet>
User-Agent: NeoMutt/20180716
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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

T24gTW9uZGF5IDExIE9jdG9iZXIgMjAyMSAyMzo1NTozNSBOYXZlZW4gTmFpZHUgd3JvdGU6Cj4g
T24gMTEvMTAsIFBhbGkgUm9ow6FyIHdyb3RlOgo+ID4gT24gTW9uZGF5IDExIE9jdG9iZXIgMjAy
MSAyMzoyNjozMyBOYXZlZW4gTmFpZHUgd3JvdGU6Cj4gPiA+IEFuIE1NSU8gcmVhZCBmcm9tIGEg
UENJIGRldmljZSB0aGF0IGRvZXNuJ3QgZXhpc3Qgb3IgZG9lc24ndCByZXNwb25kCj4gPiA+IGNh
dXNlcyBhIFBDSSBlcnJvci4gIFRoZXJlJ3Mgbm8gcmVhbCBkYXRhIHRvIHJldHVybiB0byBzYXRp
c2Z5IHRoZQo+ID4gPiBDUFUgcmVhZCwgc28gbW9zdCBoYXJkd2FyZSBmYWJyaWNhdGVzIH4wIGRh
dGEuCj4gPiA+IAo+ID4gPiBVc2UgU0VUX1BDSV9FUlJPUl9SRVNQT05TRSgpIHRvIHNldCB0aGUg
ZXJyb3IgcmVzcG9uc2UsIHdoZW4gYSBmYXVsdHkKPiA+ID4gcmVhZCBvY2N1cnMuCj4gPiA+IAo+
ID4gPiBUaGlzIGhlbHBzIHVuaWZ5IFBDSSBlcnJvciByZXNwb25zZSBjaGVja2luZyBhbmQgbWFr
ZSBlcnJvciBjaGVjawo+ID4gPiBjb25zaXN0ZW50IGFuZCBlYXNpZXIgdG8gZmluZC4KPiA+ID4g
Cj4gPiA+IENvbXBpbGUgdGVzdGVkIG9ubHkuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBO
YXZlZW4gTmFpZHUgPG5hdmVlbm5haWR1NDc5QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jIHwgOCArKysrLS0tLQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4gCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYwo+ID4gPiBpbmRleCA1OTZlYmNm
Y2M4MmQuLmRjMmY4MjBlZjU1ZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2ktYWFyZHZhcmsuYwo+ID4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aS1hYXJkdmFyay5jCj4gPiA+IEBAIC04OTQsNyArODk0LDcgQEAgc3RhdGljIGludCBhZHZrX3Bj
aWVfcmRfY29uZihzdHJ1Y3QgcGNpX2J1cyAqYnVzLCB1MzIgZGV2Zm4sCj4gPiA+ICAJaW50IHJl
dDsKPiA+ID4gIAo+ID4gPiAgCWlmICghYWR2a19wY2llX3ZhbGlkX2RldmljZShwY2llLCBidXMs
IGRldmZuKSkgewo+ID4gPiAtCQkqdmFsID0gMHhmZmZmZmZmZjsKPiA+ID4gKwkJU0VUX1BDSV9F
UlJPUl9SRVNQT05TRSh2YWwpOwo+ID4gCj4gPiBIZWxsbyEgTm93IEknbSBsb29raW5nIGF0IHRo
aXMgbWFjcm8sIGFuZCBzaG91bGQgbm90IGl0IGRlcGVuZHMgb24KPiA+ICJzaXplIiBhcmd1bWVu
dD8gSWYgZG9pbmcgOC1iaXQgb3IgMTYtYml0IHJlYWQgb3BlcmF0aW9uIHRoZW4gc2hvdWxkIG5v
dAo+ID4gaXQgcmF0aGVyIHNldHMgb25seSBsb3cgOCBiaXRzIG9yIGxvdyAxNiBiaXRzIHRvIG9u
ZXM/Cj4gPgo+IAo+IEhlbGxvIG8vLCBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gCj4gWWVz
ISB5b3UgYXJlIHJpZ2h0IHRoYXQgaXQgc2hvdWxkIGluZGVlZCBkZXBlbmQgb24gdGhlICJzaXpl
IiBhcmd1bWVudC4KPiBBbmQgdGhhdCBpcyB3aGF0IHRoZSBTRVRfUENJX0VSUk9SX1JFU1BPTlNF
IG1hY3JvIGRvZXMuIFRoZSBtYWNybyBpcwo+IGRlZmluZWQgYXM6Cj4gCj4gICAjZGVmaW5lIFBD
SV9FUlJPUl9SRVNQT05TRSAgICAgICAgICAgKH4wVUxMKQo+ICAgI2RlZmluZSBTRVRfUENJX0VS
Uk9SX1JFU1BPTlNFKHZhbCkgICgqdmFsID0gKCh0eXBlb2YoKnZhbCkpUENJX0VSUk9SX1JFU1BP
TlNFKSkKPiAKPiBUaGUgbWFjcm8gd2FzIHBhcnQgb2YgIlBhdGNoIDEvMjIiIGFuZCBpcyBwcmVz
ZW50IGhlcmUgWzFdLiBBcG9sb2dpZXMgaWYKPiBJIGFkZGVkIHRoZSByZWNlaXBpZW50IGluY29y
cmVjdGx5Lgo+IAo+IFsxXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvZDhl
NDIzMzg2YWFkM2Q3OGJjYTU3NWE3NTIxYjEzODUwODYzOGUzYi4xNjMzOTcyMjYzLmdpdC5uYXZl
ZW5uYWlkdTQ3OUBnbWFpbC5jb20vVC8jbTM3Mjk1YTBkY2ZlMGQ3ZTBmNjdlZmNlMzYzM2VmZDdi
ODkxOTQ5YzQKPiAKPiBJSVVDLCB0aGUgdHlwZW9mKCp2YWwpIGhlbHBzIGluIHNldHRpbmcgdGhl
IHZhbHVlIGFjY29yZGluZyB0byB0aGUgc2l6ZQo+IG9mIHRoZSBhcmd1bWVudC4KPiAKPiBQbGVh
c2UgbGV0IG1lIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyB3cm9uZy4KCkhlbGxvISBJIG1l
YW4gInNpemUiIGZ1bmN0aW9uIGFyZ3VtZW50IHdoaWNoIGlzIHBhc3NlZCBhcyB2YXJpYWJsZS4K
CkZ1bmN0aW9uIGl0c2VsZiBpcyBkZWNsYXJlZCBhczoKCnN0YXRpYyBpbnQgYWR2a19wY2llX3Jk
X2NvbmYoc3RydWN0IHBjaV9idXMgKmJ1cywgdTMyIGRldmZuLCBpbnQgd2hlcmUsIGludCBzaXpl
LCB1MzIgKnZhbCk7CgpBbmQgaW4gInNpemUiIGFyZ3VtZW50IGlzIHN0b3JlZCBudW1iZXIgb2Yg
Ynl0ZXMsIGtpbmQgb2YgcmVhZCBvcGVyYXRpb24KKHJlYWQgYnl0ZSwgcmVhZCB3b3JkLCByZWFk
IGR3b3JkKS4gSW4gKnZhbCBpcyB0aGVuIHN0b3JlZCByZWFkIHZhbHVlLgpGb3IgYnl0ZSBvcGVy
YXRpb24sIGp1c3QgbG93IDggYml0cyBpbiAqdmFsIHZhcmlhYmxlIGFyZSBzZXQuCgpCZWNhdXNl
ICp2YWwgaXMgdTMyIGl0IG1lYW5zIHRoYXQgdHlwZW9mKCp2YWwpIGlzIGFsd2F5cyA0IGluZGVw
ZW5kZW50bHkKb2YgdGhlICJzaXplIiBhcmd1bWVudC4KCkZvciBleGFtcGxlIG90aGVyIHByb2pl
Y3QgVS1Cb290IGhhcyBhbHNvIHBjaS1hYXJkdmFyay5jIGRyaXZlciBhbmQKVS1Cb290IGhhcyBm
b3IgKHByb2JhYmx5IHNhbWUpIHB1cnBvc2UgcGNpX2dldF9mZigpIG1hY3JvLCBzZWU6Cmh0dHBz
Oi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjEuMTAvZHJpdmVycy9w
Y2kvcGNpLWFhcmR2YXJrLmMjTDM2NwoKSSdtIG5vdCBzYXlpbmcgaWYgY3VycmVudCBhcHByb2Fj
aCB0byBhbHdheXMgc2V0cyAweGZmZmZmZmZmCihpbmRlcGVuZGVudGx5IG9mICJzaXplIiBhcmd1
bWVudCkgaXMgY29ycmVjdCBvciBub3QgYXMgSSBkbyBub3Qga25vdwppdCB0b28hIEknbSBqdXN0
IGdpdmluZyBleGFtcGxlIHRoYXQgdGhpcyBQQ0kgY29kZSBoYXMgdmVyeSBzaW1pbGFyCmltcGxl
bWVudGF0aW9uIG9mIG90aGVyIHByb2plY3QgKFUtQm9vdCkgd2hpY2ggc2V0cyBudW1iZXIgb2Yg
b25lcyBiYXNlZApvbiB0aGUgc2l6ZSBhcmd1bWVudC4KClNvIHByb2JhYmx5IHNvbWV0aGluZyBm
b3Igb3RoZXIgcGVvcGxlIHRvIGRlY2lkZS4KCkFueXdheSwgSSB2ZXJ5IGxpa2UgdGhpcyB5b3Vy
IGlkZWEgdG8gaGF2ZSBhIG1hY3JvIHdoaWNoIHB1cnBvc2UgaXMgdG8KZXhwbGljaXRseSBpbmRp
Y2F0ZSBlcnJvciBkdXJpbmcgY29uZmlnIHJlYWQgb3BlcmF0aW9uISBBbmQgdG8gdW5pZnkgYWxs
CmRyaXZlcnMgdG8gdXNlIHNhbWUgc3R5bGUgZm9yIHNpZ25hbGxpbmcgY29uZmlnIHJlYWQgZXJy
b3IuCgo+ID4gPiAgCQlyZXR1cm4gUENJQklPU19ERVZJQ0VfTk9UX0ZPVU5EOwo+ID4gPiAgCX0K
PiA+ID4gIAo+ID4gPiBAQCAtOTIwLDcgKzkyMCw3IEBAIHN0YXRpYyBpbnQgYWR2a19wY2llX3Jk
X2NvbmYoc3RydWN0IHBjaV9idXMgKmJ1cywgdTMyIGRldmZuLAo+ID4gPiAgCQkJKnZhbCA9IENG
R19SRF9DUlNfVkFMOwo+ID4gPiAgCQkJcmV0dXJuIFBDSUJJT1NfU1VDQ0VTU0ZVTDsKPiA+ID4g
IAkJfQo+ID4gPiAtCQkqdmFsID0gMHhmZmZmZmZmZjsKPiA+ID4gKwkJU0VUX1BDSV9FUlJPUl9S
RVNQT05TRSh2YWwpOwo+ID4gPiAgCQlyZXR1cm4gUENJQklPU19TRVRfRkFJTEVEOwo+ID4gPiAg
CX0KPiA+ID4gIAo+ID4gPiBAQCAtOTU1LDE0ICs5NTUsMTQgQEAgc3RhdGljIGludCBhZHZrX3Bj
aWVfcmRfY29uZihzdHJ1Y3QgcGNpX2J1cyAqYnVzLCB1MzIgZGV2Zm4sCj4gPiA+ICAJCQkqdmFs
ID0gQ0ZHX1JEX0NSU19WQUw7Cj4gPiA+ICAJCQlyZXR1cm4gUENJQklPU19TVUNDRVNTRlVMOwo+
ID4gPiAgCQl9Cj4gPiA+IC0JCSp2YWwgPSAweGZmZmZmZmZmOwo+ID4gPiArCQlTRVRfUENJX0VS
Uk9SX1JFU1BPTlNFKHZhbCk7Cj4gPiA+ICAJCXJldHVybiBQQ0lCSU9TX1NFVF9GQUlMRUQ7Cj4g
PiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJLyogQ2hlY2sgUElPIHN0YXR1cyBhbmQgZ2V0IHRoZSBy
ZWFkIHJlc3VsdCAqLwo+ID4gPiAgCXJldCA9IGFkdmtfcGNpZV9jaGVja19waW9fc3RhdHVzKHBj
aWUsIGFsbG93X2NycywgdmFsKTsKPiA+ID4gIAlpZiAocmV0IDwgMCkgewo+ID4gPiAtCQkqdmFs
ID0gMHhmZmZmZmZmZjsKPiA+ID4gKwkJU0VUX1BDSV9FUlJPUl9SRVNQT05TRSh2YWwpOwo+ID4g
PiAgCQlyZXR1cm4gUENJQklPU19TRVRfRkFJTEVEOwo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAt
LSAKPiA+ID4gMi4yNS4xCj4gPiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
