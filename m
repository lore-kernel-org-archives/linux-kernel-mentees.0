Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDADC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4326108E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C4326108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1808A4087A;
	Thu, 21 Oct 2021 15:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckuSijZy1QGi; Thu, 21 Oct 2021 15:58:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2CCA640874;
	Thu, 21 Oct 2021 15:58:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12E3EC001C;
	Thu, 21 Oct 2021 15:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C19B0C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D03040875
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOXRLpRccjKk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:58:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10F0D40874
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:58:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7965B611F2;
 Thu, 21 Oct 2021 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634831895;
 bh=L8SsVdAZqmcgc/l54J3ELRGN7EmFDhRqTkhV3QJ2iKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g68FH0cq70aXjdoLx1elPMm198APq1afbrCj255hNtE16R57d8oXEDmN7iTTXrpTW
 b9j+sr38KKZXJI8hErEfOfBkZPSwM8wXM+XVw9Ans7H1LmqDGws8Bt061fGGwjpKr5
 yY9n9zmu1e5y2pboT41A4tSMKzkRUNymNPE6ftIrcIpAvU3vm2pmgwtlEFfgjJxoQO
 DBWNCZFk3Wo6qxHitCTMYnAUlXtiQ9ceUqtvEAQPjO9jx/20veksxxDjZ8NrxEsq5h
 NtwIwY2i9gGtMiQQrZFGkXwUnTo51SirTAeX5kW80tDOcCXgxQWlpwVHGfdXNMfXkS
 MytNmg154KS0A==
Received: by pali.im (Postfix)
 id 20E5C85E; Thu, 21 Oct 2021 17:58:13 +0200 (CEST)
Date: Thu, 21 Oct 2021 17:58:12 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 11/25] PCI: aardvark: Remove redundant error
 fabrication when device read fails
Message-ID: <20211021155812.qwihgqo6dk73433w@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <cbf7437d33551cd267135d2ed2a33bb789369e85.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbf7437d33551cd267135d2ed2a33bb789369e85.1634825082.git.naveennaidu479@gmail.com>
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

T24gVGh1cnNkYXkgMjEgT2N0b2JlciAyMDIxIDIwOjM3OjM2IE5hdmVlbiBOYWlkdSB3cm90ZToK
PiBBbiBNTUlPIHJlYWQgZnJvbSBhIFBDSSBkZXZpY2UgdGhhdCBkb2Vzbid0IGV4aXN0IG9yIGRv
ZXNuJ3QgcmVzcG9uZAo+IGNhdXNlcyBhIFBDSSBlcnJvci4gVGhlcmUncyBubyByZWFsIGRhdGEg
dG8gcmV0dXJuIHRvIHNhdGlzZnkgdGhlCj4gQ1BVIHJlYWQsIHNvIG1vc3QgaGFyZHdhcmUgZmFi
cmljYXRlcyB+MCBkYXRhLgo+IAo+IFRoZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVycyBzZXRzIHRo
ZSBlcnJvciByZXNwb25zZSB2YWx1ZXMgKH4wKSBhbmQKPiByZXR1cm5zIGFuIGVycm9yIHdoZW4g
ZmF1bHR5IGhhcmR3YXJlIHJlYWQgb2NjdXJzLiBCdXQgdGhlIGVycm9yCj4gcmVzcG9uc2UgdmFs
dWUgKH4wKSBpcyBhbHJlYWR5IGJlaW5nIHNldCBpbiBQQ0lfT1BfUkVBRCBhbmQKPiBQQ0lfVVNF
Ul9SRUFEX0NPTkZJRyB3aGVuZXZlciBhIHJlYWQgYnkgaG9zdCBjb250cm9sbGVyIGRyaXZlciBm
YWlscy4KPiAKPiBUaHVzLCBpdCdzIG5vIGxvbmdlciBuZWNlc3NhcnkgZm9yIHRoZSBob3N0IGNv
bnRyb2xsZXIgZHJpdmVycyB0bwo+IGZhYnJpY2F0ZSBhbnkgZXJyb3IgcmVzcG9uc2UuCj4gCj4g
VGhpcyBoZWxwcyB1bmlmeSBQQ0kgZXJyb3IgcmVzcG9uc2UgY2hlY2tpbmcgYW5kIG1ha2UgZXJy
b3IgY2hlY2sKPiBjb25zaXN0ZW50IGFuZCBlYXNpZXIgdG8gZmluZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBOYXZlZW4gTmFpZHUgPG5hdmVlbm5haWR1NDc5QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5
OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2ktYWFyZHZhcmsuYyB8IDEwICsrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpLWFhcmR2YXJrLmMKPiBpbmRleCA1OTZlYmNmY2M4MmQuLjFhZjc3MmM3NmQwNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCj4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYwo+IEBAIC04OTMsMTAgKzg5Myw4IEBA
IHN0YXRpYyBpbnQgYWR2a19wY2llX3JkX2NvbmYoc3RydWN0IHBjaV9idXMgKmJ1cywgdTMyIGRl
dmZuLAo+ICAJdTMyIHJlZzsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKCFhZHZrX3BjaWVfdmFs
aWRfZGV2aWNlKHBjaWUsIGJ1cywgZGV2Zm4pKSB7Cj4gLQkJKnZhbCA9IDB4ZmZmZmZmZmY7Cj4g
KwlpZiAoIWFkdmtfcGNpZV92YWxpZF9kZXZpY2UocGNpZSwgYnVzLCBkZXZmbikpCj4gIAkJcmV0
dXJuIFBDSUJJT1NfREVWSUNFX05PVF9GT1VORDsKPiAtCX0KPiAgCj4gIAlpZiAocGNpX2lzX3Jv
b3RfYnVzKGJ1cykpCj4gIAkJcmV0dXJuIHBjaV9icmlkZ2VfZW11bF9jb25mX3JlYWQoJnBjaWUt
PmJyaWRnZSwgd2hlcmUsCj4gQEAgLTkyMCw3ICs5MTgsNiBAQCBzdGF0aWMgaW50IGFkdmtfcGNp
ZV9yZF9jb25mKHN0cnVjdCBwY2lfYnVzICpidXMsIHUzMiBkZXZmbiwKPiAgCQkJKnZhbCA9IENG
R19SRF9DUlNfVkFMOwo+ICAJCQlyZXR1cm4gUENJQklPU19TVUNDRVNTRlVMOwo+ICAJCX0KPiAt
CQkqdmFsID0gMHhmZmZmZmZmZjsKPiAgCQlyZXR1cm4gUENJQklPU19TRVRfRkFJTEVEOwo+ICAJ
fQo+ICAKPiBAQCAtOTU1LDE2ICs5NTIsMTMgQEAgc3RhdGljIGludCBhZHZrX3BjaWVfcmRfY29u
ZihzdHJ1Y3QgcGNpX2J1cyAqYnVzLCB1MzIgZGV2Zm4sCj4gIAkJCSp2YWwgPSBDRkdfUkRfQ1JT
X1ZBTDsKPiAgCQkJcmV0dXJuIFBDSUJJT1NfU1VDQ0VTU0ZVTDsKPiAgCQl9Cj4gLQkJKnZhbCA9
IDB4ZmZmZmZmZmY7Cj4gIAkJcmV0dXJuIFBDSUJJT1NfU0VUX0ZBSUxFRDsKPiAgCX0KPiAgCj4g
IAkvKiBDaGVjayBQSU8gc3RhdHVzIGFuZCBnZXQgdGhlIHJlYWQgcmVzdWx0ICovCj4gIAlyZXQg
PSBhZHZrX3BjaWVfY2hlY2tfcGlvX3N0YXR1cyhwY2llLCBhbGxvd19jcnMsIHZhbCk7Cj4gLQlp
ZiAocmV0IDwgMCkgewo+IC0JCSp2YWwgPSAweGZmZmZmZmZmOwo+ICsJaWYgKHJldCA8IDApCj4g
IAkJcmV0dXJuIFBDSUJJT1NfU0VUX0ZBSUxFRDsKPiAtCX0KPiAgCj4gIAlpZiAoc2l6ZSA9PSAx
KQo+ICAJCSp2YWwgPSAoKnZhbCA+PiAoOCAqICh3aGVyZSAmIDMpKSkgJiAweGZmOwo+IC0tIAo+
IDIuMjUuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNA
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
