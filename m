Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF8DC41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 13:22:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA21206CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 13:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2X7IJEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA21206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F413E86AC2;
	Sat,  3 Oct 2020 13:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qF-z78g0MK57; Sat,  3 Oct 2020 13:22:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7F0486A90;
	Sat,  3 Oct 2020 13:22:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADD0CC0889;
	Sat,  3 Oct 2020 13:22:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90070C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 13:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7869E86AAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 13:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPxJ1nFuOuS1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 13:22:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4772286A90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601731371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3Ex71Qk2HCNdVCQ44hohYZBNu63lw9VTn3OMjB5RaI=;
 b=W2X7IJEGnF5g8DidGFKujd/9ZOzGXgbiBBBnczhXhwjqD9dr776CHOnEduntDx0KDuaV/D
 IMzscbjDBcxR/jlLMz831KZSFRdBBGp1zxFiWUfs4XBpKAow2Q9TcvXp5BcphjNE5xapPO
 vlfyBDx+YPqT56gUjOe35OwasjVbWk4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-zVsVfwbuPMCQOS9R7jEFog-1; Sat, 03 Oct 2020 09:22:49 -0400
X-MC-Unique: zVsVfwbuPMCQOS9R7jEFog-1
Received: by mail-ed1-f71.google.com with SMTP id y1so2238425edw.16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 06:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T3Ex71Qk2HCNdVCQ44hohYZBNu63lw9VTn3OMjB5RaI=;
 b=E3ba9z2BktxOqeMFGw+wYsdoEVBS/MjPapZFahihXwq1cbuJGZP6vkVmdpQ7thheB5
 OQKIt57JnZ1xfkM7QV/UiUtM7Z9Qia/fIRadrPEEo9BleehiVUDXz/M2htU9q2W65Raw
 Rf26kLNCXiCT07lu2CbBpkCRux3Hvmx0LoREvjRvvzTpQHe8EIp39OGy8b0F1NlP/7sE
 EDZkladyCuhMW8kTq7KHbBbUOyYvPNnhBXiQMdVtWPJFXolLDb8r+U6BA9MHgAKwqLcq
 +ssEwxA5IsfmMmWeaid39OvMC19nE1MMiN10W2t2hFHtW/Wq0mpRMkpNqai+RTpBJT4r
 S5yA==
X-Gm-Message-State: AOAM533HzJ5X12wK9KCiEczDxGRkiz1ksNl7t8SJx0TxrqGtDo7/g2HO
 kffz2zmOKRnayOmQ+sWYdLXW/VEls/ph96O/XojMnFUTflSd0/ZN6huARN4UGwkOcqeXz//bONc
 9aYFsd0n/70iWNYPeCVYflb1ZZvWthU/TDoaUR8IhVYWZNUCN
X-Received: by 2002:a17:906:453:: with SMTP id
 e19mr6769686eja.391.1601731368018; 
 Sat, 03 Oct 2020 06:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzzs+SnF3Q3lDtXMYbYCNurYPVrOc7TH9P7/VWpDPpXgZJC52X1HLfdrWRXDlyY4QF8WZrAA==
X-Received: by 2002:a17:906:453:: with SMTP id
 e19mr6769671eja.391.1601731367760; 
 Sat, 03 Oct 2020 06:22:47 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id q22sm4383550edi.41.2020.10.03.06.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 06:22:47 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
Date: Sat, 3 Oct 2020 15:22:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002224502.vn3ooodrxrblwauu@Rk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

SGksCgpPbiAxMC8zLzIwIDEyOjQ1IEFNLCBDb2lieSBYdSB3cm90ZToKPiBPbiBGcmksIE9jdCAw
MiwgMjAyMCBhdCAwOTo0NDo1NFBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gT24gMTAvMi8yMCA0OjUxIFBNLCBDb2lieSBYdSB3cm90ZToKPj4+IE9uIEZyaSwgT2N0
IDAyLCAyMDIwIGF0IDAzOjM2OjI5UE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Cj4+
IDxzbmlwPgo+Pgo+Pj4+Pj4gU28gYXJlIHlvdSBzZWVpbmcgdGhlc2UgNyBpbnRlcnJ1cHRzIC8g
c2Vjb25kIGZvciB0aGUgdG91Y2hwYWQgaXJxIG9yIGZvcgo+Pj4+Pj4gdGhlIEdQSU8gY29udHJv
bGxlcnMgcGFyZW50IGlycSA/Cj4+Pj4+Pgo+Pj4+Pj4gQWxzbyB0byB0aGVzZSA3IGludGVycnVw
dHMvc2VjIHN0b3AgaGFwcGVuaW5nIHdoZW4geW91IGRvIG5vdCB0b3VjaCB0aGUKPj4+Pj4+IHRv
dWNocGFkID8KPj4+Pj4+Cj4+Pj4+IEkgc2VlIHRoZXNlIDcgaW50ZXJydXB0cyAvIHNlY29uZCBm
b3IgdGhlIEdQSU8gY29udHJvbGxlcidzIHBhcmVudCBpcnEuCj4+Pj4+IEFuZCB0aGV5IHN0b3Ag
aGFwcGVuaW5nIHdoZW4gSSBkb24ndCB0b3VjaCB0aGUgdG91Y2hwYWQuCj4+Pj4KPj4+PiBPbmx5
IGZyb20gdGhlIHBhcmVudCBpcnEsIG9yIGFsc28gb24gdGhlIHRvdWNocGFkIGlycSBpdHNlbGYg
Pwo+Pj4+Cj4+Pj4gSWYgdGhpcyBvbmx5IGhhcHBlbnMgb24gdGhlIHBhcmVudCBpcnEsIHRoZW4g
SSB3b3VsZCBzdGFydCBsb29raW5nIGF0IHRoZQo+Pj4+IGFtZC1waW5jdHJsIGNvZGUgd2hpY2gg
ZGV0ZXJtaW5lcyB3aGljaCBvZiBpdHMgImNoaWxkIiBpcnFzIHRvIGZpcmUuCj4+Pgo+Pj4gVGhp
cyBvbmx5IGhhcHBlbnMgb24gdGhlIHBhcmVudCBpcnEuIFRoZSBpbnB1dCdzIHBpbiMxMzAgb2Yg
dGhlIEdJUE8KPj4+IGNoaXAgaXMgbG93IG1vc3Qgb2YgdGhlIHRpbWUgYW5kIHBpbiMxMzAuCj4+
Cj4+IFJpZ2h0LCBidXQgaXQgaXMgYSBsb3ctbGV2ZWwgdHJpZ2dlcmVkIElSUSwgc28gd2hlbiBp
dCBpcyBsb3cgaXQgc2hvdWxkCj4+IGJlIGV4ZWN1dGluZyB0aGUgaTJjLWhpZCBpbnRlcnJ1cHQt
aGFuZGxlci4gSWYgaXQgaXMgbm90IGV4ZWN1dGluZyB0aGF0Cj4+IHRoZW4gaXQgaXMgdGltZSB0
byBsb29rIGF0IGFtZC1waW5jdHJsJ3MgaXJxLWhhbmRsZXIgYW5kIGZpZ3VyZSBvdXQgd2h5Cj4+
IHRoYXQgaXMgbm90IHRyaWdnZXJpbmcgdGhlIGNoaWxkIGlycSBoYW5kbGVyIGZvciB0aGUgdG91
Y2hwYWQuCj4+Cj4gSSdtIG5vdCBzdXJlIGlmIEkgaGF2ZSBzb21lIGluY29ycmVjdCB1bmRlcnN0
YW5kaW5ncyBhYm91dCBHUElPCj4gaW50ZXJydXB0IGNvbnRyb2xsZXIgYmVjYXVzZSBJIGRvbid0
IHF1aXRlIGZvbGxvdyB5b3VyIHJlYXNvbmluZy4KPiBXaGF0IEkgYWN0dWFsbHkgc3VzcGVjdCBp
cyB0aGVyZSdzIHNvbWV0aGluZyB3cm9uZyB3aXRoIGFtZC1waW5jdHJsCj4gd2hpY2ggbWFrZXMg
dGhlIEdQSU8gY2hpcCBmYWlsIHRvIGFzc2VydCBpdHMgY29tbW9uIGludGVycnVwdCBvdXRwdXQK
PiBsaW5lIGNvbm5lY3RlZCB0byBvbmUgSU8tQVBJQydzIHBpbiM3IHRodXMgSVJRIzcgZmFpbHMg
dG8gZmlyZS4gV2hhdAo+IEkgbGVhcm4gYWJvdXQgdGhpcyBsb3ctbGV2ZWwgdHJpZ2dlcmVkIElS
USBpcyB0aGF0IHRoZSBpMmMtaGlkCj4gaW50ZXJydXB0LWhhbmRsZXIgd2lsbCBiZSB3b2tlbiB1
cCBieSBhbWQtcGluY3RybCdzIGlycS1oYW5kbGVyIHdoaWNoCj4gaXMgZXhlY3V0ZWQgd2hlbiB0
aGUgcGFyZW50IElSUSM3IGZpcmVzLiBUaGUgY29kZSBwYXRoIGlzIGFzIGZvbGxvd3MsCj4gCj4g
IMKgwqDCoCA8SVJRPgo+ICDCoMKgwqAgZHVtcF9zdGFjaysweDY0LzB4ODgKPiAgwqDCoMKgIF9f
aXJxX3dha2VfdGhyZWFkLmNvbGQrMHg5LzB4MTIKPiAgwqDCoMKgIF9faGFuZGxlX2lycV9ldmVu
dF9wZXJjcHUrMHg4MC8weDFjMAo+ICDCoMKgwqAgaGFuZGxlX2lycV9ldmVudCsweDU4LzB4YjAK
PiAgwqDCoMKgIGhhbmRsZV9sZXZlbF9pcnErMHhiNy8weDFhMAo+ICDCoMKgwqAgZ2VuZXJpY19o
YW5kbGVfaXJxKzB4NGEvMHg2MAo+ICDCoMKgwqAgYW1kX2dwaW9faXJxX2hhbmRsZXIrMHgxNWYv
MHgxYjAgW3BpbmN0cmxfYW1kXQo+ICDCoMKgwqAgX19oYW5kbGVfaXJxX2V2ZW50X3BlcmNwdSsw
eDQ1LzB4MWMwCj4gIMKgwqDCoCBoYW5kbGVfaXJxX2V2ZW50KzB4NTgvMHhiMAo+ICDCoMKgwqAg
aGFuZGxlX2Zhc3Rlb2lfaXJxKzB4YTIvMHgyMTAKPiAgwqDCoMKgIGRvX0lSUSsweDcwLzB4MTIw
Cj4gIMKgwqDCoCBjb21tb25faW50ZXJydXB0KzB4Zi8weGYKPiAgwqDCoMKgIDwvSVJRPgo+IAo+
IEJ1dCB0aGUgcHJvYmxlbSBpcyBzb21laG93IElSUSM3IGRvZXNuJ3QgZXZlbiBmaXJlIHdoZW4g
dGhlIGlucHV0J3MKPiBwaW4jMTMwIG9mIHRoZSBHSVBPIGlzIGxvdy4gV2l0aG91dCBJUlEjNyBm
aXJpbmcsIGFtZC1waW5jdHJsJ3MKPiBpcnEtaGFuZGxlciB3b3VsZG4ndCBiZSBleGVjdXRlZCBp
biB0aGUgZmlyc3QgcGxhY2UsIGxldCBhbG9uZQo+IHRyaWdnZXJpbmcgdGhlIGNoaWxkIGlycSBo
YW5kbGVyLiBCdHcsIGFtZC1waW5jdHJsJ3MgaXJxLWhhbmRsZXIKPiBzaW1wbHkgaXRlcmF0ZSBv
dmVyIGFsbCBwaW5zLiBJZiB0aGVyZSBpcyBtYXBwZWQgaXJxIGZvdW5kIGZvciB0aGlzCj4gaHdp
cnEgKHllcywgaXQgd29uJ3QgZXZlbiBjaGVjayBpZiB0aGlzIHBpbiB0cmlnZ2VycyB0aGUgaW50
ZXJydXB0KSwKPiB0aGVuIGl0IHdpbGwgY2FsbCBnZW5lcmljX2hhbmRsZV9pcnEuIFNvIHRoZXJl
J3Mgbm90aGluZyB3cm9uZyBhYm91dAo+IHRoaXMgcGFydCBvZiBjb2RlLgoKT2ssIHNvIHRoZSBp
MmMtaGlkIGlycSBkb2VzIGZpcmUsIGJ1dCBvbmx5IDcgdGltZXMgYSBzZWNvbmQganVzdApsaWtl
IHRoZSBHUElPIGNvbnRyb2xsZXIncyBwYXJlbnQgaXJxLgoKVGhlIG9ubHkgdGhpbmcgSSBjYW4g
dGhpbmsgb2YgdGhlbiBpcyB0byBhZGQgcHJpbnRrLXMgdG8gY2hlY2sgaG93CmxvbmcgdGhlIGky
Yy1oaWQgaW50ZXJydXB0IGhhbmRsZXIgdGFrZXMgdG8gY29tcGxldGUuIEl0IGNvdWxkIGJlCnRo
ZXJlIGlzIGEgc3VidGxlIGJ1ZyBzb21ld2hlcmUgY2F1c2luZyB0aGUgaTJjIHRyYW5zZmVycyB0
byB0YWtlCmxvbmdlciB3aGVuIHJ1biBmcm9tIGEgKHRocmVhZGVkKSBpcnEgaGFuZGxlci4gVGhh
dCB3b3VsZCBiZSB3ZWlyZAp0aG91Z2gsIHNvIEkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gcmVzdWx0
IGluIGFueSB1c2VmdWwgZmluZGluZ3MuCgpPdGhlciB0aGVuIHRoYXQgSSdtIGFsbCBvdXQgb2Yg
aWRlYXMgSSdtIGFmcmFpZC4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
