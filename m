Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DC2C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:28:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16637206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewgczByg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16637206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B41686E6E;
	Tue,  6 Oct 2020 09:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4GS7DqIufp2; Tue,  6 Oct 2020 09:28:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFD3E86E48;
	Tue,  6 Oct 2020 09:28:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1B45C016F;
	Tue,  6 Oct 2020 09:28:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 713DFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AFA086E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xepDsEpCWSGD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:28:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0963386E48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601976490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+VkUVuxQOwSmfzYv5rs2yOEtDSy561PTZmhaDZFLuo=;
 b=ewgczBygv4JPIjFzsALzesGo/PVISJgwWoCFdlT95ERuQ5e5Qk6WZ1fw/1pCBboNZi3KaH
 iXTTSQvvpK64H2xcphUcKAhifLdXy/SgRr0gXbm6iJuBmQ95iz4W6SYFOxF2x8x0EujkIx
 IjQb5n4qRoURBSpBLULaUGn0f7WzLpo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-zwF72O6AN4-tQMGFeMVAng-1; Tue, 06 Oct 2020 05:28:09 -0400
X-MC-Unique: zwF72O6AN4-tQMGFeMVAng-1
Received: by mail-ed1-f69.google.com with SMTP id ay19so5818973edb.23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 02:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/+VkUVuxQOwSmfzYv5rs2yOEtDSy561PTZmhaDZFLuo=;
 b=cydIr0eKY2lEKCEMe5S/lYH+GklYSVNTebCU+byBPv9LJSnDlkUQvFLO3YKYDEtF8K
 veckYpF2u5+C7IVjNIvPrXOG+5IVe/Y6CLI0acsDAQ1SS5WXonKLulV2wXPg3rxgusP/
 H3hzeNHpFOdoBuAudFDDaWgm0BelVcuHmjeZXKh1MMDroo508OqcS6WPcgrdj/nnU5t7
 mr2p5qb9J3oUHcQzl1edabIqvGK+7Ra9pddvdBagwwMyLtCZOd/oRue6swT8e2epqR8M
 Y2LztC364EYnmmgd+L5lBByCkdRDmcf/i9IpZlj5wV5ptHzoD+0rKRlCgB0wieaGZSs6
 At0g==
X-Gm-Message-State: AOAM533NP8zTZ18HavP4LE1fYn+RifjmS80jiDNIRgMeET0I24d302OR
 iFZ7IW5bMJMjYymiG0pG6HGy5JbP5o+zjIMp0m9/4ULCapSce5bAi9T8TIUtrbcdGC2a+5fs7ap
 +WN0QnKb3guhHKZkV6dnyxjZNVpFPPoeGy35J91gSM0Fy9SNy
X-Received: by 2002:a17:906:698d:: with SMTP id
 i13mr3995361ejr.229.1601976487735; 
 Tue, 06 Oct 2020 02:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxshwFBXTbVsXxlCvCy43Red2MNOC89PP8wuVUVhv3mFR62PSNSVAODJXKZ1s3GPzTlmWIaTg==
X-Received: by 2002:a17:906:698d:: with SMTP id
 i13mr3995340ejr.229.1601976487419; 
 Tue, 06 Oct 2020 02:28:07 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id j18sm1671139ejc.111.2020.10.06.02.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 02:28:06 -0700 (PDT)
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
Message-ID: <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Date: Tue, 6 Oct 2020 11:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
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

SGksCgpPbiAxMC82LzIwIDEwOjU1IEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+
IE9uIDEwLzYvMjAgMTA6MzEgQU0sIENvaWJ5IFh1IHdyb3RlOgo+PiBPbiBUdWUsIE9jdCAwNiwg
MjAyMCBhdCAwODoyODo0MEFNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4gSGksCj4+
Pgo+Pj4gT24gMTAvNi8yMCA2OjQ5IEFNLCBDb2lieSBYdSB3cm90ZToKPj4+PiBIaSBIYW5zIGFu
ZCBMaW51cywKPj4+Pgo+Pj4+IEkndmUgZm91bmQgdGhlIGRpcmVjdCBldmlkZW5jZSBwcm92aW5n
IHRoZSBHUElPIGludGVycnVwdCBjb250cm9sbGVyIGlzCj4+Pj4gbWFsZnVuY3Rpb25pbmcuCj4+
Pj4KPj4+PiBJJ3ZlIGZvdW5kIGEgd2F5IHRvIGxldCB0aGUgR1BJTyBjaGlwIHRyaWdnZXIgYW4g
aW50ZXJydXB0IGJ5IGFjY2lkZW50Cj4+Pj4gd2hlbiBwbGF5aW5nIHdpdGggdGhlIEdQSU8gc3lz
ZnMgaW50ZXJmYWNlLAo+Pj4+Cj4+Pj4gwqAtIGV4cG9ydCBwaW4xMzAgd2hpY2ggaXMgdXNlZCBi
eSB0aGUgdG91Y2hhZAo+Pj4+IMKgLSBzZXQgdGhlIGRpcmVjdGlvbiB0byBiZSAib3V0Igo+Pj4+
IMKgLSBgZWNobyAwID4gdmFsdWVgIHdpbGwgdHJpZ2dlciB0aGUgR1BJTyBjb250cm9sbGVyJ3Mg
cGFyZW50IGlycSBhbmQKPj4+PiDCoMKgICJlY2hvIDEgPiB2YWx1ZSIgd2lsbCBtYWtlIGl0IHN0
b3AgZmlyaW5nCj4+Pj4KPj4+PiAoSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgeWV0IGFub3RoZXIg
YnVnIG9mIHRoZSBHUElPIGNoaXAuIEFueXdheSBJIGNhbgo+Pj4+IG1hbnVhbGx5IHRyaWdnZXIg
YW4gaW50ZXJydXB0IG5vdy4pCj4+Pj4KPj4+PiBJIHdyb3RlIGEgQyBwcm9ncmFtIGlzIHRvIGxl
dCBHUElPIGNvbnRyb2xsZXIgcXVpY2tseSBnZW5lcmF0ZSBzb21lCj4+Pj4gaW50ZXJydXB0cyB0
aGVuIGRpc2FibGUgdGhlIGZpcmluZyBvZiBpbnRlcnJ1cHRzIGJ5IHRvZ2dsaW5nIHBpbiMxMzAn
cwo+Pj4+IHZhbHVlIHdpdGggYW4gc3BlY2lmaWVkIHRpbWUgaW50ZXJ2YWwsIGkuZS4sIHNldCB0
aGUgdmFsdWUgdG8gMCBmaXJzdAo+Pj4+IGFuZCB0aGVuIGFmdGVyIHNvbWUgdGltZSwgcmUtc2V0
IHRoZSB2YWx1ZSB0byAxLiBUaGVyZSBpcyBubyBpbnRlcnJ1cHQKPj4+PiBmaXJpbmcgdW5sZXNz
IHRpbWUgaW50ZXJuYWwgPiAxMjBtcyAofjdIeikuIFRoaXMgZXhwbGFpbnMgd2h5IHdlIGNhbgo+
Pj4+IG9ubHkgc2VlIDcgaW50ZXJydXB0cyBmb3IgdGhlIEdQSU8gY29udHJvbGxlcidzIHBhcmVu
dCBpcnEuCj4+Pgo+Pj4gVGhhdCBpcyBhIGdyZWF0IGZpbmQsIHdlbGwgZG9uZS4KPj4+Cj4+Pj4g
TXkgaHlwb3RoZXNpcyBpcyB0aGUgR1BJTyBkb2Vzbid0IGhhdmUgcHJvcGVyIHBvd2VyIHNldHRp
bmcgc28gaXQgc3RheXMKPj4+PiBpbiBhbiBpZGxlIHN0YXRlIG9yIGl0cyBjbG9jayBmcmVxdWVu
Y3kgaXMgdG9vIGxvdyBieSBkZWZhdWx0IHRodXMgbm90Cj4+Pj4gcXVpY2sgZW5vdWdoIHRvIHJl
YWQgaW50ZXJydXB0IGlucHV0LiBUaGVuIHBpbmN0cmwtYW1kIG11c3QgbWlzcyBzb21lCj4+Pj4g
Y29kZSB0byBjb25maWd1cmUgdGhlIGNoaXAgYW5kIEkgbmVlZCBhIGhhcmR3YXJlIHJlZmVyZW5j
ZSBtYW51YWwgb2YgdGhpcwo+Pj4+IEdQSU8gY2hpcCAoSElEOiBBTURJMDAzMCkgb3IgcmV2ZXJz
ZS1lbmdpbmVlciB0aGUgZHJpdmVyIGZvciBXaW5kb3dzCj4+Pj4gc2luY2UgSSBjb3VsZG4ndCBm
aW5kIGEgY29weSBvZiByZWZlcmVuY2UgbWFudWFsIG9ubGluZT8gV2hhdCB3b3VsZCB5b3UKPj4+
PiBzdWdnZXN0Pwo+Pj4KPj4+IFRoaXMgc291bmRzIGxpa2UgaXQgbWlnaHQgaGF2ZSBzb21ldGhp
bmcgdG8gZG8gd2l0aCB0aGUgZ2xpdGNoIGZpbHRlci4KPj4+IFRoZSBjb2RlIGluIHBpbmN0cmwt
YW1kLmMgdG8gc2V0dXAgdGhlIHRyaWdnZXItdHlwZSBhbHNvIGNvbmZpZ3VyZXMKPj4+IHRoZSBn
bGl0Y2ggZmlsdGVyLCB5b3UgY291bGQgdHJ5IGNoYW5naW5nIHRoYXQgY29kZSB0byBkaXNhYmxl
IHRoZQo+Pj4gZ2xpdGNoLWZpbHRlci4gVGhlIGRlZmluZXMgZm9yIHNldHRpbmcgdGhlIGdsaXRj
aC1maWx0ZXIgYml0cyB0bwo+Pj4gZGlzYWJsZWQgYXJlIGFscmVhZHkgdGhlcmUuCj4+Pgo+Pgo+
PiBEaXNhYmxpbmcgdGhlIGdsaXRjaCBmaWx0ZXIgd29ya3MgbGlrZSBhIGNoYXJtISBPdGhlciBl
bnRodXNpYXN0aWMKPj4gTGludXggdXNlcnMgd2hvIGhhdmUgYmVlbiB0cm91YmxlZCBieSB0aGlz
IGlzc3VlIGZvciBtb250aHMgd291bGQKPj4gYWxzbyBmZWVsIGdyZWF0IHRvIGtub3cgdGhpcyBz
bWFsbCB0d2Vha2luZyBjb3VsZCBicmluZyB0aGVpcgo+PiB0b3VjaHBhZCBiYWNrIHRvIGxpZmU6
KSBUaGFuayB5b3UhCj4gCj4gVGhhdCBpcyBnb29kIHRvIGhlYXIsIEknbSBnbGFkIHRoYXQgd2Ug
aGF2ZSBmaW5hbGx5IGZvdW5kIGEgc29sdXRpb24uCj4gCj4+ICQgZ2l0IGRpZmYKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jIGIvZHJpdmVycy9waW5jdHJsL3Bp
bmN0cmwtYW1kLmMKPj4gaW5kZXggOWE3NjBmNWNkN2VkLi5lNzg2ZDc3OWQ2YzggMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jCj4+ICsrKyBiL2RyaXZlcnMvcGlu
Y3RybC9waW5jdHJsLWFtZC5jCj4+IEBAIC00NjMsNyArNDYzLDcgQEAgc3RhdGljIGludCBhbWRf
Z3Bpb19pcnFfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlwZSkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX3JlZyAmPSB+KEFDVElWRV9M
RVZFTF9NQVNLIDw8IEFDVElWRV9MRVZFTF9PRkYpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwaW5fcmVnIHw9IEFDVElWRV9MT1cgPDwgQUNUSVZFX0xFVkVMX09GRjsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX3JlZyAmPSB+KERCX0NOVFJsX01B
U0sgPDwgREJfQ05UUkxfT0ZGKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlu
X3JlZyB8PSBEQl9UWVBFX1BSRVNFUlZFX0hJR0hfR0xJVENIIDw8IERCX0NOVFJMX09GRjsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoqIHBpbl9yZWcgfD0gREJfVFlQRV9QUkVT
RVJWRV9ISUdIX0dMSVRDSCA8PCBEQl9DTlRSTF9PRkY7ICovCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlycV9zZXRfaGFuZGxlcl9sb2NrZWQoZCwgaGFuZGxlX2xldmVsX2ly
cSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pgo+PiBJIHdp
bGwgbGVhcm4gbW9yZSBhYm91dCB0aGUgZ2xpdGNoIGZpbHRlciBhbmQgdGhlIGltcGxlbWVudGF0
aW9uIG9mCj4+IHBpbmN0cmwgYW5kIHNlZSBpZiBJIGNhbiBkaXNhYmxlIGdsaXRjaCBmaWx0ZXIg
b25seSBmb3IgdGhpcyB0b3VjaHBhZC4KPiAKPiBUaGUgZ2xpdGNoIGZpbHRlciBsaWtlbHkgYWxz
byBoYXMgc2V0dGluZ3MgZm9yIGhvdyBsb25nIGEgZ2xpdGNoCj4gbGFzdHMsIHdoaWNoIGFwcGFy
ZW50bHkgZ29lcyBhbGwgdGhlIHdheSB1cCB0byAxMjBtcy4gSWYgaXQgd291bGQKPiBvbmx5IGRl
bGF5IHJlcG9ydGluZyBieSBzYXkgMC4xbXMgYW5kIGNvbnNpZGVyIGFueSBwdWxzZSBsb25nZXIK
PiB0aGVuIDAuMXMgbm90IGEgZ2xpdGNoLCB0aGVuIGhhdmluZyBpdCBlbmFibGVkIHdvdWxkIGJl
IGZpbmUuCj4gCj4gSSBkb24ndCB0aGluayB3ZSB3YW50IHNvbWUgc29ydCBvZiBxdWlyayBoZXJl
IHRvIG9ubHkgZGlzYWJsZSB0aGUKPiBnbGl0Y2ggZmlsdGVyIGZvciBzb21lIHRvdWNocGFkcy4g
T25lIGFwcHJvYWNoIG1pZ2h0IGJlIHRvIHNpbXBseQo+IGRpc2FibGUgaXQgY29tcGxldGVseSBm
b3IgbGV2ZWwgdHlwZSBpcnFzLgo+IAo+IFdoYXQgd2UgcmVhbGx5IG5lZWQgaGVyZSBpcyBzb21l
IGlucHV0IGZyb20gQU1EIGVuZ2luZWVycyB3aXRoIGhvdwo+IHRoaXMgaXMgYWxsIHN1cHBvc2Vk
IHRvIHdvcmsuCj4gCj4gRS5nLiBtYXliZSB0aGUgZ2xpdGNoLWZpbHRlciBpcyBzZXR1cCBieSB0
aGUgQklPUyBhbmQgd2Ugc2hvdWxkIG5vdAo+IHRvdWNoIGl0IGFsbCA/Cj4gCj4gT3IgbWF5YmUg
aW5zdGVhZCBvZiBEQl9UWVBFX1BSRVNFUlZFX0hJR0hfR0xJVENIIGxvdyBsZXZlbCBpbnRlcnJ1
cHRzCj4gc2hvdWxkIHVzZSBEQl9UWVBFX1BSRVNFUlZFX0xPV19HTElUQ0ggP8KgwqAgU29tZSBk
b2NzIGZvciB0aGUgaHcKPiB3b3VsZCByZWFsbHkgaGVscCBoZXJlIC4uLgoKU28gSSd2ZSBiZWVu
IGRpZ2dpbmcgdGhyb3VnaCB0aGUgaGlzdG9yeSBvZiB0aGUgcGluY3RybC1hbWQuYyBkcml2ZXIK
YW5kIG9uY2UgdXBvbiBhIHRpbWUgaXQgdXNlZCB0byBzZXQgYSBkZWZhdWx0IGRlYm91bmNlIHRp
bWUgb2YKMi43NSBtcy4KClNlZSB0aGUgcGF0Y2ggZ2VuZXJhdGVkIGJ5IGRvaW5nOgoKZ2l0IGZv
cm1hdC1wYXRjaCA4Y2Y0MzQ1NTc1YTQxNmU2ODU2YTY4NTZhYzZlYWEzMWFkODgzMTI2fi4uOGNm
NDM0NTU3NWE0MTZlNjg1NmE2ODU2YWM2ZWFhMzFhZDg4MzEyNgoKSW4gYSBsaW51eCBrZXJuZWwg
Y2hlY2tvdXQuCgpTbyBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBhZGQgYSBkZWJ1Z2dpbmcg
cHJpbnRrIHRvIHNlZQp3aGF0IHRoZSB2YWx1ZSBvZiBwaW5fcmVnICYgREJfVE1SX09VVF9NQVNL
IGlzIGZvciB0aGUgdHJvdWJsZXNvbWUKR1BJTy4KCkkgZ3Vlc3MgdGhhdCBpdCBtaWdodCBiZSBh
bGwgMXMgKDB4ZmZmZmZmZmZmKSBvciBzb21lIHN1Y2ggd2hpY2gKbWlnaHQgYmUgYSB3YXkgdG8g
Y2hlY2sgdGhhdCB3ZSBzaG91bGQgZGlzYWJsZSB0aGUgZ2xpdGNoLWZpbHRlcgpmb3IgdGhpcyBw
aW4/CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
