Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C97C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 06:28:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0D2206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 06:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YsDHSUVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0D2206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB8F83507;
	Tue,  6 Oct 2020 06:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqamDfjitS2d; Tue,  6 Oct 2020 06:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 564E6834D8;
	Tue,  6 Oct 2020 06:28:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E691C016F;
	Tue,  6 Oct 2020 06:28:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73A61C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6E78986C94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2RvCfBA3hrt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 344B386C1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601965725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1QwREq0y9kxw73/YPlBeF9wLu9Bg4SvS+ntbKXf8ro=;
 b=YsDHSUVtlRq6G8a49qkc3jACS9S99UAKsDZmT7riDvN/bDevvJM0UoworXJI9Wxx9T/kwQ
 7CCPlrjzIWjAX1JAkRoHWf4be8sWWai5qQlnbZicIIZTxizoC/o++7oDCAF17ks+N4KQkZ
 GTdp9OeZbazOwKdXXjULlCbnEMZpY0A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-epnWJBGmOSC99KzE_epIQQ-1; Tue, 06 Oct 2020 02:28:44 -0400
X-MC-Unique: epnWJBGmOSC99KzE_epIQQ-1
Received: by mail-ed1-f69.google.com with SMTP id j1so5669944edv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 23:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1QwREq0y9kxw73/YPlBeF9wLu9Bg4SvS+ntbKXf8ro=;
 b=MLTamEIf0+xYhK3ypuxkMVcWdbMERraZnxtCml59OqiYvKeWnOCrd1wNfi2XVr7/cl
 1yA1aXecr1ALiNTtyr8QAObsSM/bL9q8wKnvd3hDqtgXNtFIxlBhoRv9YtkKMiPsUMxK
 nw2dv881am0sjQK0eFweghlbEnqTxZCd7hhPn9cMc26yyhhQ6A6tazDkPjn7L3M5NgEI
 b5ndsFREUsSsa7UyZHNc320bVSyQ6iYxmzIxmJ1c7wEVrMW9Ck4zqmo86/GSaGH5JM2G
 02jNCmJJRcdbpcz6Zk7Wbu3jjUYW57+kra8PQgr2HZukm9WydmR/QZYFJ4tHViVvqxYm
 3rlA==
X-Gm-Message-State: AOAM53069X7fEZkQz4hzrDIYHd963K4mQ9AiSX5MBzf0oQbbN0hJXHCx
 LD8Rl+u/JAF/7rPd2kWPRvbvVWsa/lcG9SQkc7g0zoOF3OazIzNMPeGq1Nfmd11ZE5hDPa4/3o9
 o/iwEohCbm8JD7R4c30pLg/fQC4JRA+HnpKMm0x486ytCWa3/
X-Received: by 2002:a17:907:104f:: with SMTP id
 oy15mr3650541ejb.261.1601965722750; 
 Mon, 05 Oct 2020 23:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyZS3P6Oh+XRK/p67YJIRT/oRsPUdOV2clxFth3LomOFXoGdgoONHKeMpo/z/uma3nEj/N3Q==
X-Received: by 2002:a17:907:104f:: with SMTP id
 oy15mr3650511ejb.261.1601965722442; 
 Mon, 05 Oct 2020 23:28:42 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id t4sm1385333ejj.6.2020.10.05.23.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 23:28:41 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
References: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
Date: Tue, 6 Oct 2020 08:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006044941.fdjsp346kc5thyzy@Rk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

SGksCgpPbiAxMC82LzIwIDY6NDkgQU0sIENvaWJ5IFh1IHdyb3RlOgo+IEhpIEhhbnMgYW5kIExp
bnVzLAo+IAo+IEkndmUgZm91bmQgdGhlIGRpcmVjdCBldmlkZW5jZSBwcm92aW5nIHRoZSBHUElP
IGludGVycnVwdCBjb250cm9sbGVyIGlzCj4gbWFsZnVuY3Rpb25pbmcuCj4gCj4gSSd2ZSBmb3Vu
ZCBhIHdheSB0byBsZXQgdGhlIEdQSU8gY2hpcCB0cmlnZ2VyIGFuIGludGVycnVwdCBieSBhY2Np
ZGVudAo+IHdoZW4gcGxheWluZyB3aXRoIHRoZSBHUElPIHN5c2ZzIGludGVyZmFjZSwKPiAKPiAg
wqAtIGV4cG9ydCBwaW4xMzAgd2hpY2ggaXMgdXNlZCBieSB0aGUgdG91Y2hhZAo+ICDCoC0gc2V0
IHRoZSBkaXJlY3Rpb24gdG8gYmUgIm91dCIKPiAgwqAtIGBlY2hvIDAgPiB2YWx1ZWAgd2lsbCB0
cmlnZ2VyIHRoZSBHUElPIGNvbnRyb2xsZXIncyBwYXJlbnQgaXJxIGFuZAo+ICDCoMKgICJlY2hv
IDEgPiB2YWx1ZSIgd2lsbCBtYWtlIGl0IHN0b3AgZmlyaW5nCj4gCj4gKEknbSBub3Qgc3VyZSBp
ZiB0aGlzIGlzIHlldCBhbm90aGVyIGJ1ZyBvZiB0aGUgR1BJTyBjaGlwLiBBbnl3YXkgSSBjYW4K
PiBtYW51YWxseSB0cmlnZ2VyIGFuIGludGVycnVwdCBub3cuKQo+IAo+IEkgd3JvdGUgYSBDIHBy
b2dyYW0gaXMgdG8gbGV0IEdQSU8gY29udHJvbGxlciBxdWlja2x5IGdlbmVyYXRlIHNvbWUKPiBp
bnRlcnJ1cHRzIHRoZW4gZGlzYWJsZSB0aGUgZmlyaW5nIG9mIGludGVycnVwdHMgYnkgdG9nZ2xp
bmcgcGluIzEzMCdzCj4gdmFsdWUgd2l0aCBhbiBzcGVjaWZpZWQgdGltZSBpbnRlcnZhbCwgaS5l
Liwgc2V0IHRoZSB2YWx1ZSB0byAwIGZpcnN0Cj4gYW5kIHRoZW4gYWZ0ZXIgc29tZSB0aW1lLCBy
ZS1zZXQgdGhlIHZhbHVlIHRvIDEuIFRoZXJlIGlzIG5vIGludGVycnVwdAo+IGZpcmluZyB1bmxl
c3MgdGltZSBpbnRlcm5hbCA+IDEyMG1zICh+N0h6KS4gVGhpcyBleHBsYWlucyB3aHkgd2UgY2Fu
Cj4gb25seSBzZWUgNyBpbnRlcnJ1cHRzIGZvciB0aGUgR1BJTyBjb250cm9sbGVyJ3MgcGFyZW50
IGlycS4KClRoYXQgaXMgYSBncmVhdCBmaW5kLCB3ZWxsIGRvbmUuCgo+IE15IGh5cG90aGVzaXMg
aXMgdGhlIEdQSU8gZG9lc24ndCBoYXZlIHByb3BlciBwb3dlciBzZXR0aW5nIHNvIGl0IHN0YXlz
Cj4gaW4gYW4gaWRsZSBzdGF0ZSBvciBpdHMgY2xvY2sgZnJlcXVlbmN5IGlzIHRvbyBsb3cgYnkg
ZGVmYXVsdCB0aHVzIG5vdAo+IHF1aWNrIGVub3VnaCB0byByZWFkIGludGVycnVwdCBpbnB1dC4g
VGhlbiBwaW5jdHJsLWFtZCBtdXN0IG1pc3Mgc29tZQo+IGNvZGUgdG8gY29uZmlndXJlIHRoZSBj
aGlwIGFuZCBJIG5lZWQgYSBoYXJkd2FyZSByZWZlcmVuY2UgbWFudWFsIG9mIHRoaXMKPiBHUElP
IGNoaXAgKEhJRDogQU1ESTAwMzApIG9yIHJldmVyc2UtZW5naW5lZXIgdGhlIGRyaXZlciBmb3Ig
V2luZG93cwo+IHNpbmNlIEkgY291bGRuJ3QgZmluZCBhIGNvcHkgb2YgcmVmZXJlbmNlIG1hbnVh
bCBvbmxpbmU/IFdoYXQgd291bGQgeW91Cj4gc3VnZ2VzdD8KClRoaXMgc291bmRzIGxpa2UgaXQg
bWlnaHQgaGF2ZSBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGUgZ2xpdGNoIGZpbHRlci4KVGhlIGNv
ZGUgaW4gcGluY3RybC1hbWQuYyB0byBzZXR1cCB0aGUgdHJpZ2dlci10eXBlIGFsc28gY29uZmln
dXJlcwp0aGUgZ2xpdGNoIGZpbHRlciwgeW91IGNvdWxkIHRyeSBjaGFuZ2luZyB0aGF0IGNvZGUg
dG8gZGlzYWJsZSB0aGUKZ2xpdGNoLWZpbHRlci4gVGhlIGRlZmluZXMgZm9yIHNldHRpbmcgdGhl
IGdsaXRjaC1maWx0ZXIgYml0cyB0bwpkaXNhYmxlZCBhcmUgYWxyZWFkeSB0aGVyZS4KClJlZ2Fy
ZHMsCgpIYW5zCgoKCgo+IAo+IFRoYW5rIHlvdSEKPiAKPiBPbiBTdW4sIE9jdCAwNCwgMjAyMCBh
dCAwMToxNjo0NFBNICswODAwLCBDb2lieSBYdSB3cm90ZToKPj4gT24gU3VuLCBPY3QgMDQsIDIw
MjAgYXQgMDc6MDM6NDBBTSArMDgwMCwgQ29pYnkgWHUgd3JvdGU6Cj4+PiBPbiBTYXQsIE9jdCAw
MywgMjAyMCBhdCAwMzoyMjo0NlBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4+IEhp
LAo+Pj4+Cj4+Pj4gT24gMTAvMy8yMCAxMjo0NSBBTSwgQ29pYnkgWHUgd3JvdGU6Cj4+Pj4+IE9u
IEZyaSwgT2N0IDAyLCAyMDIwIGF0IDA5OjQ0OjU0UE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3Jv
dGU6Cj4+Pj4+PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBPbiAxMC8yLzIwIDQ6NTEgUE0sIENvaWJ5IFh1
IHdyb3RlOgo+Pj4+Pj4+IE9uIEZyaSwgT2N0IDAyLCAyMDIwIGF0IDAzOjM2OjI5UE0gKzAyMDAs
IEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gPHNuaXA+Cj4+Pj4+Pgo+Pj4+Pj4+
Pj4+IFNvIGFyZSB5b3Ugc2VlaW5nIHRoZXNlIDcgaW50ZXJydXB0cyAvIHNlY29uZCBmb3IgdGhl
IHRvdWNocGFkIGlycSBvciBmb3IKPj4+Pj4+Pj4+PiB0aGUgR1BJTyBjb250cm9sbGVycyBwYXJl
bnQgaXJxID8KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFsc28gdG8gdGhlc2UgNyBpbnRlcnJ1cHRz
L3NlYyBzdG9wIGhhcHBlbmluZyB3aGVuIHlvdSBkbyBub3QgdG91Y2ggdGhlCj4+Pj4+Pj4+Pj4g
dG91Y2hwYWQgPwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJIHNlZSB0aGVzZSA3IGludGVycnVwdHMg
LyBzZWNvbmQgZm9yIHRoZSBHUElPIGNvbnRyb2xsZXIncyBwYXJlbnQgaXJxLgo+Pj4+Pj4+Pj4g
QW5kIHRoZXkgc3RvcCBoYXBwZW5pbmcgd2hlbiBJIGRvbid0IHRvdWNoIHRoZSB0b3VjaHBhZC4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gT25seSBmcm9tIHRoZSBwYXJlbnQgaXJxLCBvciBhbHNvIG9uIHRo
ZSB0b3VjaHBhZCBpcnEgaXRzZWxmID8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSWYgdGhpcyBvbmx5IGhh
cHBlbnMgb24gdGhlIHBhcmVudCBpcnEsIHRoZW4gSSB3b3VsZCBzdGFydCBsb29raW5nIGF0IHRo
ZQo+Pj4+Pj4+PiBhbWQtcGluY3RybCBjb2RlIHdoaWNoIGRldGVybWluZXMgd2hpY2ggb2YgaXRz
ICJjaGlsZCIgaXJxcyB0byBmaXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBvbmx5IGhhcHBlbnMg
b24gdGhlIHBhcmVudCBpcnEuIFRoZSBpbnB1dCdzIHBpbiMxMzAgb2YgdGhlIEdJUE8KPj4+Pj4+
PiBjaGlwIGlzIGxvdyBtb3N0IG9mIHRoZSB0aW1lIGFuZCBwaW4jMTMwLgo+Pj4+Pj4KPj4+Pj4+
IFJpZ2h0LCBidXQgaXQgaXMgYSBsb3ctbGV2ZWwgdHJpZ2dlcmVkIElSUSwgc28gd2hlbiBpdCBp
cyBsb3cgaXQgc2hvdWxkCj4+Pj4+PiBiZSBleGVjdXRpbmcgdGhlIGkyYy1oaWQgaW50ZXJydXB0
LWhhbmRsZXIuIElmIGl0IGlzIG5vdCBleGVjdXRpbmcgdGhhdAo+Pj4+Pj4gdGhlbiBpdCBpcyB0
aW1lIHRvIGxvb2sgYXQgYW1kLXBpbmN0cmwncyBpcnEtaGFuZGxlciBhbmQgZmlndXJlIG91dCB3
aHkKPj4+Pj4+IHRoYXQgaXMgbm90IHRyaWdnZXJpbmcgdGhlIGNoaWxkIGlycSBoYW5kbGVyIGZv
ciB0aGUgdG91Y2hwYWQuCj4+Pj4+Pgo+Pj4+PiBJJ20gbm90IHN1cmUgaWYgSSBoYXZlIHNvbWUg
aW5jb3JyZWN0IHVuZGVyc3RhbmRpbmdzIGFib3V0IEdQSU8KPj4+Pj4gaW50ZXJydXB0IGNvbnRy
b2xsZXIgYmVjYXVzZSBJIGRvbid0IHF1aXRlIGZvbGxvdyB5b3VyIHJlYXNvbmluZy4KPj4+Pj4g
V2hhdCBJIGFjdHVhbGx5IHN1c3BlY3QgaXMgdGhlcmUncyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBh
bWQtcGluY3RybAo+Pj4+PiB3aGljaCBtYWtlcyB0aGUgR1BJTyBjaGlwIGZhaWwgdG8gYXNzZXJ0
IGl0cyBjb21tb24gaW50ZXJydXB0IG91dHB1dAo+Pj4+PiBsaW5lIGNvbm5lY3RlZCB0byBvbmUg
SU8tQVBJQydzIHBpbiM3IHRodXMgSVJRIzcgZmFpbHMgdG8gZmlyZS4gV2hhdAo+Pj4+PiBJIGxl
YXJuIGFib3V0IHRoaXMgbG93LWxldmVsIHRyaWdnZXJlZCBJUlEgaXMgdGhhdCB0aGUgaTJjLWhp
ZAo+Pj4+PiBpbnRlcnJ1cHQtaGFuZGxlciB3aWxsIGJlIHdva2VuIHVwIGJ5IGFtZC1waW5jdHJs
J3MgaXJxLWhhbmRsZXIgd2hpY2gKPj4+Pj4gaXMgZXhlY3V0ZWQgd2hlbiB0aGUgcGFyZW50IElS
USM3IGZpcmVzLiBUaGUgY29kZSBwYXRoIGlzIGFzIGZvbGxvd3MsCj4+Pj4+Cj4+Pj4+IMOD4oCa
w4LCoMOD4oCaw4LCoMOD4oCaw4LCoCA8SVJRPgo+Pj4+PiDDg+KAmsOCwqDDg+KAmsOCwqDDg+KA
msOCwqAgZHVtcF9zdGFjaysweDY0LzB4ODgKPj4+Pj4gw4PigJrDgsKgw4PigJrDgsKgw4PigJrD
gsKgIF9faXJxX3dha2VfdGhyZWFkLmNvbGQrMHg5LzB4MTIKPj4+Pj4gw4PigJrDgsKgw4PigJrD
gsKgw4PigJrDgsKgIF9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUrMHg4MC8weDFjMAo+Pj4+PiDD
g+KAmsOCwqDDg+KAmsOCwqDDg+KAmsOCwqAgaGFuZGxlX2lycV9ldmVudCsweDU4LzB4YjAKPj4+
Pj4gw4PigJrDgsKgw4PigJrDgsKgw4PigJrDgsKgIGhhbmRsZV9sZXZlbF9pcnErMHhiNy8weDFh
MAo+Pj4+PiDDg+KAmsOCwqDDg+KAmsOCwqDDg+KAmsOCwqAgZ2VuZXJpY19oYW5kbGVfaXJxKzB4
NGEvMHg2MAo+Pj4+PiDDg+KAmsOCwqDDg+KAmsOCwqDDg+KAmsOCwqAgYW1kX2dwaW9faXJxX2hh
bmRsZXIrMHgxNWYvMHgxYjAgW3BpbmN0cmxfYW1kXQo+Pj4+PiDDg+KAmsOCwqDDg+KAmsOCwqDD
g+KAmsOCwqAgX19oYW5kbGVfaXJxX2V2ZW50X3BlcmNwdSsweDQ1LzB4MWMwCj4+Pj4+IMOD4oCa
w4LCoMOD4oCaw4LCoMOD4oCaw4LCoCBoYW5kbGVfaXJxX2V2ZW50KzB4NTgvMHhiMAo+Pj4+PiDD
g+KAmsOCwqDDg+KAmsOCwqDDg+KAmsOCwqAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4YTIvMHgyMTAK
Pj4+Pj4gw4PigJrDgsKgw4PigJrDgsKgw4PigJrDgsKgIGRvX0lSUSsweDcwLzB4MTIwCj4+Pj4+
IMOD4oCaw4LCoMOD4oCaw4LCoMOD4oCaw4LCoCBjb21tb25faW50ZXJydXB0KzB4Zi8weGYKPj4+
Pj4gw4PigJrDgsKgw4PigJrDgsKgw4PigJrDgsKgIDwvSVJRPgo+Pj4+Pgo+Pj4+PiBCdXQgdGhl
IHByb2JsZW0gaXMgc29tZWhvdyBJUlEjNyBkb2Vzbid0IGV2ZW4gZmlyZSB3aGVuIHRoZSBpbnB1
dCdzCj4+Pj4+IHBpbiMxMzAgb2YgdGhlIEdJUE8gaXMgbG93LiBXaXRob3V0IElSUSM3IGZpcmlu
ZywgYW1kLXBpbmN0cmwncwo+Pj4+PiBpcnEtaGFuZGxlciB3b3VsZG4ndCBiZSBleGVjdXRlZCBp
biB0aGUgZmlyc3QgcGxhY2UsIGxldCBhbG9uZXQKPj4+Pj4gdHJpZ2dlcmluZyB0aGUgY2hpbGQg
aXJxIGhhbmRsZXIuIEJ0dywgYW1kLXBpbmN0cmwncyBpcnEtaGFuZGxlcgo+Pj4+PiBzaW1wbHkg
aXRlcmF0ZSBvdmVyIGFsbCBwaW5zLiBJZiB0aGVyZSBpcyBtYXBwZWQgaXJxIGZvdW5kIGZvciB0
aGlzCj4+Pj4+IGh3aXJxICh5ZXMsIGl0IHdvbid0IGV2ZW4gY2hlY2sgaWYgdGhpcyBwaW4gdHJp
Z2dlcnMgdGhlIGludGVycnVwdCksCj4+Pj4+IHRoZW4gaXQgd2lsbCBjYWxsIGdlbmVyaWNfaGFu
ZGxlX2lycS4gU28gdGhlcmUncyBub3RoaW5nIHdyb25nIGFib3V0Cj4+Pj4+IHRoaXMgcGFydCBv
ZiBjb2RlLgo+Pj4+Cj4+Pj4gT2ssIHNvIHRoZSBpMmMtaGlkIGlycSBkb2VzIGZpcmUsIGJ1dCBv
bmx5IDcgdGltZXMgYSBzZWNvbmQganVzdAo+Pj4+IGxpa2UgdGhlIEdQSU8gY29udHJvbGxlcidz
IHBhcmVudCBpcnEuCj4+Pj4KPj4+IEknbSBub3Qgc3VyZSBpZiBpdCdzIGNvcnJlY3QgdG8gc2F5
IGlmIGhpMmMtaGlkIGlycSBmaXJlcyBvciBub3QgYW5kIGhvdwo+Pj4gZnJlcXVlbnRseSBpdCBm
aXJlcyBzaW5jZSB0aGUgaTJjLWhpZCBpcnEgaXMgbWFwcGVkIHRvIHBpbiMxMzAgb2YgdGhlCj4+
PiBHUElPIGludGVycnVwdCBjb250cm9sbGVyIGFuZCB0aGUgdG91Y2hwYWQgaGFzIGFub3RoZXIg
aW50ZXJydXB0IGxpbmUKPj4+IGNvbm5lY3RlZCB0byBwaW4jMTMwIHdoaWNoIGZpcmVzIHRvIGlu
ZGljYXRlIG5ldyBkYXRhLiBBbGwgd2Uga25vdyBpcwo+Pj4gcGluIzEzMCBvZiB0aGUgR1BJTyBj
aGlwIGhhcyBsb3cgaW5wdXQgbW9zdCBvZiB0aGUgdGltZSB3aGVuIHRoZSBmaW5nZXIKPj4+IGlz
IG9uIHRoZSB0b3VjaHBhZCBzbyB3ZSBjYW4gaW5mZXIgdGhlIHRvdWNocGFkIGhhcyBiZWVuIHRy
eWluZyB0bwo+Pj4gbm90aWZ5IHRoZSBrZXJuZWwgb2YgbmV3IGRhdGEgYnV0IHNvbWVob3cgR1BJ
TydzIHBhcmVudCBpcnEgb25seSBmaXJlcyA3Cj4+PiB0aW1lcyAvIHNlY29uZC4KPj4+Cj4+Pj4g
VGhlIG9ubHkgdGhpbmcgSSBjYW4gdGhpbmsgb2YgdGhlbiBpcyB0byBhZGQgcHJpbnRrLXMgdG8g
Y2hlY2sgaG93Cj4+Pj4gbG9uZyB0aGUgaTJjLWhpZCBpbnRlcnJ1cHQgaGFuZGxlciB0YWtlcyB0
byBjb21wbGV0ZS4gSXQgY291bGQgYmUKPj4+PiB0aGVyZSBpcyBhIHN1YnRsZSBidWcgc29tZXdo
ZXJlIGNhdXNpbmcgdGhlIGkyYyB0cmFuc2ZlcnMgdG8gdGFrZQo+Pj4+IGxvbmdlciB3aGVuIHJ1
biBmcm9tIGEgKHRocmVhZGVkKSBpcnEgaGFuZGxlci4gVGhhdCB3b3VsZCBiZSB3ZWlyZAo+Pj4+
IHRob3VnaCwgc28gSSBkb24ndCBleHBlY3QgdGhpcyB0byByZXN1bHQgaW4gYW55IHVzZWZ1bCBm
aW5kaW5ncy4KPj4+Pgo+Pj4KPj4+IEkgYWxzbyBkb3VidGVkIGlmIGl0IHRha2VzIHRvbyBtdWNo
IHRpbWUgZm9yIHRoZSBpMmMtaGlkIGhhbmRsZXIgdG8KPj4+IGZpbmlzaCByZWFkaW5nIGkyYyB0
cmFuc2ZlciwgcHJvY2Vzc2luZyBkYXRhIGFuZCBkZWxpdmVyaW5nIHRvIHRoZSBpbnB1dAo+Pj4g
c3lzdGVtLiBBZnRlciBtZWFzdXJpbmcgdGhlIHRpbWUgaW50ZXJuYWwgYmV0d2VlbiB0aGUgc3Rh
cnRpbmcgb2YgdGhlCj4+PiBHUElPIGlycSdzIHBhcmVudCBoYW5kbGVyIGFuZCB3aGVuIHBpbiMx
MzAgaXMgdW5tYXNrZWQsIHdlIGNhbiBleGNsdWRlCj4+PiB0aGlzIHBvc3NpYmlsaXR5Lgo+Pj4K
Pj4+IEkgaGF2ZSBiZWVuIHdvbmRlcmluZyBpZiB3ZSBsZXQgbWFrZSBwaW4jMTMwIGhhdmUgbG93
IGlucHV0IHRodXMgdG8KPj4+IHRyaWdnZXIgYSBpbnRlcnJ1cHQgZmlyaW5nIG9yIGFzc2VydCB0
aGUgR1BJTydzIGNvbW1vbiBpbnRlcnJ1cHQgb3V0cHV0Cj4+PiBsaW5lIG1hbnVhbGx5IHRodXMg
d2UgY2FuIG1lYXN1cmUgaG93IGxvbmcgZG9lcyBpdCB0YWtlIGZvciB0aGUga2VybmVsCj4+PiB0
byByZWNlaXZlIHRoZSBzaWduYWwuIEJ1dCBvbmNlIEdQSU8ncyBwaW4gaXMgcHJvZ3JhbW1lZCB0
byBiZSBhCj4+PiBpbnRlcnJ1cHQgbGluZSB3ZSBjYW4ndCB3cml0ZSBhbnl0aGluZyB0byBpdCBh
bmQgaXQgc2VlbXMgb3RoZXIKPj4+IGludGVycnVwdHMgY2FuIG9ubHkgYmUgZ2VuZXJhdGVkIGJ5
IHRoZSBoYXJkd2FyZS4gU28gdGhpcyBpZGVhIGlzIG5vdAo+Pj4gcGxhdXNpYmxlCj4+Pgo+Pgo+
PiBCdHcsIHRoZXJlIGFyZSBvdGhlciB1c2VycyB3aG8gaGF2ZSB0aGUgc2FtZSBsYXB0b3AgbW9k
ZWwgYnV0IHdpdGggYQo+PiBkaWZmZXJlbnQgdG91Y2hwYWQgKEVMQU4pLiBUaGVpciB0b3VjaHBh
ZHMgd291bGQgc2hvdyBpbgo+PiAvcHJvYy9idXMvaW5wdXQvZGV2aWNlcyBidXQgYXJlIGNvbXBs
ZXRlbHkgZGVhZC4gaGlkLXJlY29yZGVyIHdoaWNoCj4+IHdpbGwgcmVhZCBISUQgcmVwb3J0cyBm
cm9tIC9kZXYvaGlkcmF3IGdldHMgbm90aGluZyBpZiB0aGV5IHB1dCB0aGVyZQo+PiBmaW5nZXJz
IG9uIHRoZSB0b3VjaHBhZCBidXQgdGhlIHBvbGxpbmcgbW9kZSBjb3VsZCBhbHNvIHNhdmUgdGhl
aXIKPj4gdG91Y2hwYWRzLiBJdCBzZWVtcyBHUElPIGNvbnRyb2xsZXIncyBwYXJlbnQgaXJxIGZv
ciB0aGUgRUxBTiB0b3VjaHBhZAo+PiBkb2Vzbid0IGV2ZW4gZmlyZSBvbmNlLiBBbmQgdW5saWtl
IEdQSU8sIElPLUFQSUMgaGFzIGFsc28gYmUgdXNlZCBieQo+PiBvdGhlciBkZXZpY2VzIGxpa2Ug
dGhlIGtleWJvYXJkLiBTbyBtYXliZSBpdCdzIHNhZmUgdG8gYXNzZXJ0IHRoZSByb290Cj4+IGNh
dXNlIGlzIGZyb20gdGhlIEdQSU8gY29udHJvbGxlci4KPj4KPj4+PiBPdGhlciB0aGVuIHRoYXQg
SSdtIGFsbCBvdXQgb2YgaWRlYXMgSSdtIGFmcmFpZC4KPj4+Pgo+Pj4gVGhhbmsgeW91IGZvciB0
YWtpbmcgdGltZSB0byBpbnZlc3RpZ2F0ZSB0aGlzIGlzc3VlIGFueXdheSEgSGF2ZSBhIG5pY2UK
Pj4+IHdlZWtlbmQ6KQo+Pj4+IFJlZ2FyZHMsCj4+Pj4KPj4+PiBIYW5zCj4+Pj4KPj4+Cj4+PiAt
LSAKPj4+IEJlc3QgcmVnYXJkcywKPj4+IENvaWJ5Cj4+Cj4+IC0tIAo+PiBCZXN0IHJlZ2FyZHMs
Cj4+IENvaWJ5Cj4gCj4gLS0gCj4gQmVzdCByZWdhcmRzLAo+IENvaWJ5Cj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVl
cyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1rZXJuZWwtbWVudGVlcwo=
