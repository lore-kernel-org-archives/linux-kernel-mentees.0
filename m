Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B7EC41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:29:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5E4206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WKlIAjId"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5E4206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3D0886EB1;
	Tue,  6 Oct 2020 09:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWCFppdG1Xqw; Tue,  6 Oct 2020 09:29:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 160F586E48;
	Tue,  6 Oct 2020 09:29:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 091C8C016F;
	Tue,  6 Oct 2020 09:29:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EE41C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 791DC86E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EMaCVkZzVIj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2142D86E48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601976585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXv1cpmfS7DidtwvWPelMZqKFOEn27KsnWAhr9V/IuU=;
 b=WKlIAjIdcG7WN9a8LkzPXXjavKvjFph3Aa5+B+shrwPj85dK9DvqhgZoezYWrGX4aHkk0K
 dbEcO6NA/9jkV3lMZ/IOTPhuYG0IqPUmJtS9P5oWKB16TQQS/WoafF7jugEmo3VsL+vr/G
 3qBEaXNIYsS2+8KTDikTQGRw4TLGJEY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-5HuR61rhNB2QTnp217uupQ-1; Tue, 06 Oct 2020 05:29:43 -0400
X-MC-Unique: 5HuR61rhNB2QTnp217uupQ-1
Received: by mail-ej1-f69.google.com with SMTP id z8so3910173ejw.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 02:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXv1cpmfS7DidtwvWPelMZqKFOEn27KsnWAhr9V/IuU=;
 b=NPb1Xw0vOWDd2qt6KLT7VCTbdTBmMRTMcD9ie8+klAtfSg23ozJSo6rnQvrKfIx3Ba
 thJTiTwkD50iCjNoI7JXkd8TCzi90qx3UMP6R1YCI7Q6DF2Bsj6EcAZjI729SDre4jLf
 wVfauLLlWeg9pHSt5Q+l/kIm63IuDtZjECt0pTvlEz+LEnYRFxCU7O842VfTRayRP8rG
 frwswyqPKxn33Zh5va0eiYG2qOfok0i5NuuPeqlOMB+2cFK/lUCSzFmEJOqQ/LJ21xhR
 tGuxhEGc6Dy2prL1/O9rX1YgYlEQJFb0hIDUYxDVxbGQ4F18nY7+REAQh9qjEujd7RGw
 rNjg==
X-Gm-Message-State: AOAM532BtYL2ZJ4hK4uJTPa8VDIxlxbNLzhN9MKvQblD8ZTqsqk3siY4
 yr4+KWljRZAZyE7B+1Xx6jFlR70gzqUYcj1VtXL4ZrEUNvLFV2EtohJkXPJpcme5VFjk75P3PG+
 cQ9Kihwts4FoHUkKBGHlGJy0e1YtetFKHR5aPTyO0RI+brarC
X-Received: by 2002:a17:906:fcae:: with SMTP id
 qw14mr4303498ejb.537.1601976581579; 
 Tue, 06 Oct 2020 02:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt3THOjCxOsAr0dwdzICXXl+xDFBFxJoKr1UzMh8Edlhy5XBTPQUSNVxG4P2YFCqzLuhCb9g==
X-Received: by 2002:a17:906:fcae:: with SMTP id
 qw14mr4303471ejb.537.1601976581311; 
 Tue, 06 Oct 2020 02:29:41 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id j9sm1714609ejt.49.2020.10.06.02.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 02:29:40 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
References: <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Message-ID: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
Date: Tue, 6 Oct 2020 11:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
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

CgpPbiAxMC82LzIwIDExOjI4IEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzYvMjAgMTA6NTUgQU0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAx
MC82LzIwIDEwOjMxIEFNLCBDb2lieSBYdSB3cm90ZToKPj4+IE9uIFR1ZSwgT2N0IDA2LCAyMDIw
IGF0IDA4OjI4OjQwQU0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4K
Pj4+PiBPbiAxMC82LzIwIDY6NDkgQU0sIENvaWJ5IFh1IHdyb3RlOgo+Pj4+PiBIaSBIYW5zIGFu
ZCBMaW51cywKPj4+Pj4KPj4+Pj4gSSd2ZSBmb3VuZCB0aGUgZGlyZWN0IGV2aWRlbmNlIHByb3Zp
bmcgdGhlIEdQSU8gaW50ZXJydXB0IGNvbnRyb2xsZXIgaXMKPj4+Pj4gbWFsZnVuY3Rpb25pbmcu
Cj4+Pj4+Cj4+Pj4+IEkndmUgZm91bmQgYSB3YXkgdG8gbGV0IHRoZSBHUElPIGNoaXAgdHJpZ2dl
ciBhbiBpbnRlcnJ1cHQgYnkgYWNjaWRlbnQKPj4+Pj4gd2hlbiBwbGF5aW5nIHdpdGggdGhlIEdQ
SU8gc3lzZnMgaW50ZXJmYWNlLAo+Pj4+Pgo+Pj4+PiDCoC0gZXhwb3J0IHBpbjEzMCB3aGljaCBp
cyB1c2VkIGJ5IHRoZSB0b3VjaGFkCj4+Pj4+IMKgLSBzZXQgdGhlIGRpcmVjdGlvbiB0byBiZSAi
b3V0Igo+Pj4+PiDCoC0gYGVjaG8gMCA+IHZhbHVlYCB3aWxsIHRyaWdnZXIgdGhlIEdQSU8gY29u
dHJvbGxlcidzIHBhcmVudCBpcnEgYW5kCj4+Pj4+IMKgwqAgImVjaG8gMSA+IHZhbHVlIiB3aWxs
IG1ha2UgaXQgc3RvcCBmaXJpbmcKPj4+Pj4KPj4+Pj4gKEknbSBub3Qgc3VyZSBpZiB0aGlzIGlz
IHlldCBhbm90aGVyIGJ1ZyBvZiB0aGUgR1BJTyBjaGlwLiBBbnl3YXkgSSBjYW4KPj4+Pj4gbWFu
dWFsbHkgdHJpZ2dlciBhbiBpbnRlcnJ1cHQgbm93LikKPj4+Pj4KPj4+Pj4gSSB3cm90ZSBhIEMg
cHJvZ3JhbSBpcyB0byBsZXQgR1BJTyBjb250cm9sbGVyIHF1aWNrbHkgZ2VuZXJhdGUgc29tZQo+
Pj4+PiBpbnRlcnJ1cHRzIHRoZW4gZGlzYWJsZSB0aGUgZmlyaW5nIG9mIGludGVycnVwdHMgYnkg
dG9nZ2xpbmcgcGluIzEzMCdzCj4+Pj4+IHZhbHVlIHdpdGggYW4gc3BlY2lmaWVkIHRpbWUgaW50
ZXJ2YWwsIGkuZS4sIHNldCB0aGUgdmFsdWUgdG8gMCBmaXJzdAo+Pj4+PiBhbmQgdGhlbiBhZnRl
ciBzb21lIHRpbWUsIHJlLXNldCB0aGUgdmFsdWUgdG8gMS4gVGhlcmUgaXMgbm8gaW50ZXJydXB0
Cj4+Pj4+IGZpcmluZyB1bmxlc3MgdGltZSBpbnRlcm5hbCA+IDEyMG1zICh+N0h6KS4gVGhpcyBl
eHBsYWlucyB3aHkgd2UgY2FuCj4+Pj4+IG9ubHkgc2VlIDcgaW50ZXJydXB0cyBmb3IgdGhlIEdQ
SU8gY29udHJvbGxlcidzIHBhcmVudCBpcnEuCj4+Pj4KPj4+PiBUaGF0IGlzIGEgZ3JlYXQgZmlu
ZCwgd2VsbCBkb25lLgo+Pj4+Cj4+Pj4+IE15IGh5cG90aGVzaXMgaXMgdGhlIEdQSU8gZG9lc24n
dCBoYXZlIHByb3BlciBwb3dlciBzZXR0aW5nIHNvIGl0IHN0YXlzCj4+Pj4+IGluIGFuIGlkbGUg
c3RhdGUgb3IgaXRzIGNsb2NrIGZyZXF1ZW5jeSBpcyB0b28gbG93IGJ5IGRlZmF1bHQgdGh1cyBu
b3QKPj4+Pj4gcXVpY2sgZW5vdWdoIHRvIHJlYWQgaW50ZXJydXB0IGlucHV0LiBUaGVuIHBpbmN0
cmwtYW1kIG11c3QgbWlzcyBzb21lCj4+Pj4+IGNvZGUgdG8gY29uZmlndXJlIHRoZSBjaGlwIGFu
ZCBJIG5lZWQgYSBoYXJkd2FyZSByZWZlcmVuY2UgbWFudWFsIG9mIHRoaXMKPj4+Pj4gR1BJTyBj
aGlwIChISUQ6IEFNREkwMDMwKSBvciByZXZlcnNlLWVuZ2luZWVyIHRoZSBkcml2ZXIgZm9yIFdp
bmRvd3MKPj4+Pj4gc2luY2UgSSBjb3VsZG4ndCBmaW5kIGEgY29weSBvZiByZWZlcmVuY2UgbWFu
dWFsIG9ubGluZT8gV2hhdCB3b3VsZCB5b3UKPj4+Pj4gc3VnZ2VzdD8KPj4+Pgo+Pj4+IFRoaXMg
c291bmRzIGxpa2UgaXQgbWlnaHQgaGF2ZSBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGUgZ2xpdGNo
IGZpbHRlci4KPj4+PiBUaGUgY29kZSBpbiBwaW5jdHJsLWFtZC5jIHRvIHNldHVwIHRoZSB0cmln
Z2VyLXR5cGUgYWxzbyBjb25maWd1cmVzCj4+Pj4gdGhlIGdsaXRjaCBmaWx0ZXIsIHlvdSBjb3Vs
ZCB0cnkgY2hhbmdpbmcgdGhhdCBjb2RlIHRvIGRpc2FibGUgdGhlCj4+Pj4gZ2xpdGNoLWZpbHRl
ci4gVGhlIGRlZmluZXMgZm9yIHNldHRpbmcgdGhlIGdsaXRjaC1maWx0ZXIgYml0cyB0bwo+Pj4+
IGRpc2FibGVkIGFyZSBhbHJlYWR5IHRoZXJlLgo+Pj4+Cj4+Pgo+Pj4gRGlzYWJsaW5nIHRoZSBn
bGl0Y2ggZmlsdGVyIHdvcmtzIGxpa2UgYSBjaGFybSEgT3RoZXIgZW50aHVzaWFzdGljCj4+PiBM
aW51eCB1c2VycyB3aG8gaGF2ZSBiZWVuIHRyb3VibGVkIGJ5IHRoaXMgaXNzdWUgZm9yIG1vbnRo
cyB3b3VsZAo+Pj4gYWxzbyBmZWVsIGdyZWF0IHRvIGtub3cgdGhpcyBzbWFsbCB0d2Vha2luZyBj
b3VsZCBicmluZyB0aGVpcgo+Pj4gdG91Y2hwYWQgYmFjayB0byBsaWZlOikgVGhhbmsgeW91IQo+
Pgo+PiBUaGF0IGlzIGdvb2QgdG8gaGVhciwgSSdtIGdsYWQgdGhhdCB3ZSBoYXZlIGZpbmFsbHkg
Zm91bmQgYSBzb2x1dGlvbi4KPj4KPj4+ICQgZ2l0IGRpZmYKPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BpbmN0cmwvcGluY3RybC1hbWQuYyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5j
Cj4+PiBpbmRleCA5YTc2MGY1Y2Q3ZWQuLmU3ODZkNzc5ZDZjOCAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jCj4+PiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGlu
Y3RybC1hbWQuYwo+Pj4gQEAgLTQ2Myw3ICs0NjMsNyBAQCBzdGF0aWMgaW50IGFtZF9ncGlvX2ly
cV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX3JlZyAmPSB+KEFDVElWRV9MRVZFTF9N
QVNLIDw8IEFDVElWRV9MRVZFTF9PRkYpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGluX3JlZyB8PSBBQ1RJVkVfTE9XIDw8IEFDVElWRV9MRVZFTF9PRkY7Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5fcmVnICY9IH4oREJfQ05UUmxfTUFTSyA8
PCBEQl9DTlRSTF9PRkYpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX3Jl
ZyB8PSBEQl9UWVBFX1BSRVNFUlZFX0hJR0hfR0xJVENIIDw8IERCX0NOVFJMX09GRjsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qKiBwaW5fcmVnIHw9IERCX1RZUEVfUFJFU0VS
VkVfSElHSF9HTElUQ0ggPDwgREJfQ05UUkxfT0ZGOyAqLwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaXJxX3NldF9oYW5kbGVyX2xvY2tlZChkLCBoYW5kbGVfbGV2ZWxfaXJx
KTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4KPj4+IEkg
d2lsbCBsZWFybiBtb3JlIGFib3V0IHRoZSBnbGl0Y2ggZmlsdGVyIGFuZCB0aGUgaW1wbGVtZW50
YXRpb24gb2YKPj4+IHBpbmN0cmwgYW5kIHNlZSBpZiBJIGNhbiBkaXNhYmxlIGdsaXRjaCBmaWx0
ZXIgb25seSBmb3IgdGhpcyB0b3VjaHBhZC4KPj4KPj4gVGhlIGdsaXRjaCBmaWx0ZXIgbGlrZWx5
IGFsc28gaGFzIHNldHRpbmdzIGZvciBob3cgbG9uZyBhIGdsaXRjaAo+PiBsYXN0cywgd2hpY2gg
YXBwYXJlbnRseSBnb2VzIGFsbCB0aGUgd2F5IHVwIHRvIDEyMG1zLiBJZiBpdCB3b3VsZAo+PiBv
bmx5IGRlbGF5IHJlcG9ydGluZyBieSBzYXkgMC4xbXMgYW5kIGNvbnNpZGVyIGFueSBwdWxzZSBs
b25nZXIKPj4gdGhlbiAwLjFzIG5vdCBhIGdsaXRjaCwgdGhlbiBoYXZpbmcgaXQgZW5hYmxlZCB3
b3VsZCBiZSBmaW5lLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgc29tZSBzb3J0IG9mIHF1
aXJrIGhlcmUgdG8gb25seSBkaXNhYmxlIHRoZQo+PiBnbGl0Y2ggZmlsdGVyIGZvciBzb21lIHRv
dWNocGFkcy4gT25lIGFwcHJvYWNoIG1pZ2h0IGJlIHRvIHNpbXBseQo+PiBkaXNhYmxlIGl0IGNv
bXBsZXRlbHkgZm9yIGxldmVsIHR5cGUgaXJxcy4KPj4KPj4gV2hhdCB3ZSByZWFsbHkgbmVlZCBo
ZXJlIGlzIHNvbWUgaW5wdXQgZnJvbSBBTUQgZW5naW5lZXJzIHdpdGggaG93Cj4+IHRoaXMgaXMg
YWxsIHN1cHBvc2VkIHRvIHdvcmsuCj4+Cj4+IEUuZy4gbWF5YmUgdGhlIGdsaXRjaC1maWx0ZXIg
aXMgc2V0dXAgYnkgdGhlIEJJT1MgYW5kIHdlIHNob3VsZCBub3QKPj4gdG91Y2ggaXQgYWxsID8K
Pj4KPj4gT3IgbWF5YmUgaW5zdGVhZCBvZiBEQl9UWVBFX1BSRVNFUlZFX0hJR0hfR0xJVENIIGxv
dyBsZXZlbCBpbnRlcnJ1cHRzCj4+IHNob3VsZCB1c2UgREJfVFlQRV9QUkVTRVJWRV9MT1dfR0xJ
VENIID/CoMKgIFNvbWUgZG9jcyBmb3IgdGhlIGh3Cj4+IHdvdWxkIHJlYWxseSBoZWxwIGhlcmUg
Li4uCj4gCj4gU28gSSd2ZSBiZWVuIGRpZ2dpbmcgdGhyb3VnaCB0aGUgaGlzdG9yeSBvZiB0aGUg
cGluY3RybC1hbWQuYyBkcml2ZXIKPiBhbmQgb25jZSB1cG9uIGEgdGltZSBpdCB1c2VkIHRvIHNl
dCBhIGRlZmF1bHQgZGVib3VuY2UgdGltZSBvZgo+IDIuNzUgbXMuCj4gCj4gU2VlIHRoZSBwYXRj
aCBnZW5lcmF0ZWQgYnkgZG9pbmc6Cj4gCj4gZ2l0IGZvcm1hdC1wYXRjaCA4Y2Y0MzQ1NTc1YTQx
NmU2ODU2YTY4NTZhYzZlYWEzMWFkODgzMTI2fi4uOGNmNDM0NTU3NWE0MTZlNjg1NmE2ODU2YWM2
ZWFhMzFhZDg4MzEyNgo+IAo+IEluIGEgbGludXgga2VybmVsIGNoZWNrb3V0Lgo+IAo+IFNvIGl0
IHdvdWxkIGJlIGludGVyZXN0aW5nIHRvIGFkZCBhIGRlYnVnZ2luZyBwcmludGsgdG8gc2VlCj4g
d2hhdCB0aGUgdmFsdWUgb2YgcGluX3JlZyAmIERCX1RNUl9PVVRfTUFTSyBpcyBmb3IgdGhlIHRy
b3VibGVzb21lCj4gR1BJTy4KPiAKPiBJIGd1ZXNzIHRoYXQgaXQgbWlnaHQgYmUgYWxsIDFzICgw
eGZmZmZmZmZmZikgb3Igc29tZSBzdWNoIHdoaWNoCj4gbWlnaHQgYmUgYSB3YXkgdG8gY2hlY2sg
dGhhdCB3ZSBzaG91bGQgZGlzYWJsZSB0aGUgZ2xpdGNoLWZpbHRlcgo+IGZvciB0aGlzIHBpbj8K
CnAucy4KCk9yIG1heWJlIHdlIHNob3VsZCBzaW1wbHkgc3RvcCB0b3VjaGluZyBhbGwgdGhlIGds
aXRjaC1maWx0ZXIKcmVsYXRlZCBiaXRzLCBpbiB0aGUgc2FtZSB3YXkgYXMgdGhhdCBvbGQgY29t
bWl0IGhhcyBhbHJlYWR5CnJlbW92ZWQgdGhlIGNvZGUgc2V0dGluZyB0aGUgdGltaW5nIG9mIHRo
ZSBmaWx0ZXIgPwoKQXQgbGVhc3QgaXMgc2VlbXMgdGhhdCBmb3JjaW5nIHRoZSBmaWx0ZXIgdG8g
YmUgb24gd2l0aG91dApzYW5pdGl6aW5nIHRoZSBkZS1ib3VuY2UgdGltZSBpcyBub3QgYSBnb29k
IGlkZWEuCgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
