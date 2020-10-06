Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67A3C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 08:55:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB3C2075A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 08:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUWuvcAA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB3C2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82A8585AE0;
	Tue,  6 Oct 2020 08:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mzf2KSe+uxXK; Tue,  6 Oct 2020 08:55:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C765859BE;
	Tue,  6 Oct 2020 08:55:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27427C07FF;
	Tue,  6 Oct 2020 08:55:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D1F6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A59C85516
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 08:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2ZZsszIK4rR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 08:55:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 486B3854F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601974551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXi5R524UoxXZBnPFt8e05UKMzH4aET8AjGaKqKHXGI=;
 b=UUWuvcAAtdk1INO5n1FhsXf4r7wwli2hnA6Z4fg7gGRAxYJSS5OWvz9PdCmeFz2um/sFJY
 ny1fjj+T0z0+kY5fUIY16UGMD7TmoFnyO3iVKp23TyCXNdDNoLqyr3xuAAyhje9zg6naaH
 OxFhLvqCkstFLlQHN1vbbkT7YvQzkLU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-B5gRXBHHOY2pLkgRc3MG-A-1; Tue, 06 Oct 2020 04:55:50 -0400
X-MC-Unique: B5gRXBHHOY2pLkgRc3MG-A-1
Received: by mail-ed1-f69.google.com with SMTP id p3so5843148edu.20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 01:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXi5R524UoxXZBnPFt8e05UKMzH4aET8AjGaKqKHXGI=;
 b=I93DJe3yfiKA1wzkniWx2HRPck+1O3l9Qdc5vP/hysZaodXMid6oguBMl/IBRePfeS
 RT2fAdryRanIY/oOPjS+fSaiaJvHHG/7T8LfP7XmAxujy/gveKfkqASFEU0HgdZGIkAH
 9rBO6NQVew5jWM/MS8pyEGoxUNh279so5m+KTXWAkd+p0AQ8OwtKN8/Kb17q34sQTALI
 EmJv4myo9AWOTrm1755AjdFmV6JqTJpOPr2HqPveauizsseDtyeFgbMikcenkctyc4+U
 uwGm6uMdHhKbI/P6GX90k4cUBzlsaSwZZWzAUPqWjCqtTZC0S2WOzS/a+KktFtmIP2Kt
 HAUA==
X-Gm-Message-State: AOAM530fiqp7rnCQ0J9RVsNqasOKHwQkJ4p1WtVlSzTzktEyCNOUUnvO
 EGsDi4wFFMc1dEXQpgVSRDRYi2M+u1T+Rt3rugeu2zoqe6I1oNgLVJlsuQeTxQzKv2MG1AX/9tw
 xxWXxu68R9Rt83/vFRQhOMjGcEE+597VWyBqziVh0A7Auyx5C
X-Received: by 2002:a17:906:1b15:: with SMTP id
 o21mr4146359ejg.19.1601974548686; 
 Tue, 06 Oct 2020 01:55:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcRCXLb2sxU3dTwL4y+XXfs9Kd1nPtCw4KdO5HQqlAMyBZIU558UtAI/JzCTCWws0jgIjJhg==
X-Received: by 2002:a17:906:1b15:: with SMTP id
 o21mr4146340ejg.19.1601974548425; 
 Tue, 06 Oct 2020 01:55:48 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id e1sm1879323edm.11.2020.10.06.01.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 01:55:47 -0700 (PDT)
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
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
Date: Tue, 6 Oct 2020 10:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006083157.3pg6zvju5buxspns@Rk>
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

SGksCgpPbiAxMC82LzIwIDEwOjMxIEFNLCBDb2lieSBYdSB3cm90ZToKPiBPbiBUdWUsIE9jdCAw
NiwgMjAyMCBhdCAwODoyODo0MEFNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gT24gMTAvNi8yMCA2OjQ5IEFNLCBDb2lieSBYdSB3cm90ZToKPj4+IEhpIEhhbnMgYW5k
IExpbnVzLAo+Pj4KPj4+IEkndmUgZm91bmQgdGhlIGRpcmVjdCBldmlkZW5jZSBwcm92aW5nIHRo
ZSBHUElPIGludGVycnVwdCBjb250cm9sbGVyIGlzCj4+PiBtYWxmdW5jdGlvbmluZy4KPj4+Cj4+
PiBJJ3ZlIGZvdW5kIGEgd2F5IHRvIGxldCB0aGUgR1BJTyBjaGlwIHRyaWdnZXIgYW4gaW50ZXJy
dXB0IGJ5IGFjY2lkZW50Cj4+PiB3aGVuIHBsYXlpbmcgd2l0aCB0aGUgR1BJTyBzeXNmcyBpbnRl
cmZhY2UsCj4+Pgo+Pj4gwqAtIGV4cG9ydCBwaW4xMzAgd2hpY2ggaXMgdXNlZCBieSB0aGUgdG91
Y2hhZAo+Pj4gwqAtIHNldCB0aGUgZGlyZWN0aW9uIHRvIGJlICJvdXQiCj4+PiDCoC0gYGVjaG8g
MCA+IHZhbHVlYCB3aWxsIHRyaWdnZXIgdGhlIEdQSU8gY29udHJvbGxlcidzIHBhcmVudCBpcnEg
YW5kCj4+PiDCoMKgICJlY2hvIDEgPiB2YWx1ZSIgd2lsbCBtYWtlIGl0IHN0b3AgZmlyaW5nCj4+
Pgo+Pj4gKEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHlldCBhbm90aGVyIGJ1ZyBvZiB0aGUgR1BJ
TyBjaGlwLiBBbnl3YXkgSSBjYW4KPj4+IG1hbnVhbGx5IHRyaWdnZXIgYW4gaW50ZXJydXB0IG5v
dy4pCj4+Pgo+Pj4gSSB3cm90ZSBhIEMgcHJvZ3JhbSBpcyB0byBsZXQgR1BJTyBjb250cm9sbGVy
IHF1aWNrbHkgZ2VuZXJhdGUgc29tZQo+Pj4gaW50ZXJydXB0cyB0aGVuIGRpc2FibGUgdGhlIGZp
cmluZyBvZiBpbnRlcnJ1cHRzIGJ5IHRvZ2dsaW5nIHBpbiMxMzAncwo+Pj4gdmFsdWUgd2l0aCBh
biBzcGVjaWZpZWQgdGltZSBpbnRlcnZhbCwgaS5lLiwgc2V0IHRoZSB2YWx1ZSB0byAwIGZpcnN0
Cj4+PiBhbmQgdGhlbiBhZnRlciBzb21lIHRpbWUsIHJlLXNldCB0aGUgdmFsdWUgdG8gMS4gVGhl
cmUgaXMgbm8gaW50ZXJydXB0Cj4+PiBmaXJpbmcgdW5sZXNzIHRpbWUgaW50ZXJuYWwgPiAxMjBt
cyAofjdIeikuIFRoaXMgZXhwbGFpbnMgd2h5IHdlIGNhbgo+Pj4gb25seSBzZWUgNyBpbnRlcnJ1
cHRzIGZvciB0aGUgR1BJTyBjb250cm9sbGVyJ3MgcGFyZW50IGlycS4KPj4KPj4gVGhhdCBpcyBh
IGdyZWF0IGZpbmQsIHdlbGwgZG9uZS4KPj4KPj4+IE15IGh5cG90aGVzaXMgaXMgdGhlIEdQSU8g
ZG9lc24ndCBoYXZlIHByb3BlciBwb3dlciBzZXR0aW5nIHNvIGl0IHN0YXlzCj4+PiBpbiBhbiBp
ZGxlIHN0YXRlIG9yIGl0cyBjbG9jayBmcmVxdWVuY3kgaXMgdG9vIGxvdyBieSBkZWZhdWx0IHRo
dXMgbm90Cj4+PiBxdWljayBlbm91Z2ggdG8gcmVhZCBpbnRlcnJ1cHQgaW5wdXQuIFRoZW4gcGlu
Y3RybC1hbWQgbXVzdCBtaXNzIHNvbWUKPj4+IGNvZGUgdG8gY29uZmlndXJlIHRoZSBjaGlwIGFu
ZCBJIG5lZWQgYSBoYXJkd2FyZSByZWZlcmVuY2UgbWFudWFsIG9mIHRoaXMKPj4+IEdQSU8gY2hp
cCAoSElEOiBBTURJMDAzMCkgb3IgcmV2ZXJzZS1lbmdpbmVlciB0aGUgZHJpdmVyIGZvciBXaW5k
b3dzCj4+PiBzaW5jZSBJIGNvdWxkbid0IGZpbmQgYSBjb3B5IG9mIHJlZmVyZW5jZSBtYW51YWwg
b25saW5lPyBXaGF0IHdvdWxkIHlvdQo+Pj4gc3VnZ2VzdD8KPj4KPj4gVGhpcyBzb3VuZHMgbGlr
ZSBpdCBtaWdodCBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoZSBnbGl0Y2ggZmlsdGVyLgo+
PiBUaGUgY29kZSBpbiBwaW5jdHJsLWFtZC5jIHRvIHNldHVwIHRoZSB0cmlnZ2VyLXR5cGUgYWxz
byBjb25maWd1cmVzCj4+IHRoZSBnbGl0Y2ggZmlsdGVyLCB5b3UgY291bGQgdHJ5IGNoYW5naW5n
IHRoYXQgY29kZSB0byBkaXNhYmxlIHRoZQo+PiBnbGl0Y2gtZmlsdGVyLiBUaGUgZGVmaW5lcyBm
b3Igc2V0dGluZyB0aGUgZ2xpdGNoLWZpbHRlciBiaXRzIHRvCj4+IGRpc2FibGVkIGFyZSBhbHJl
YWR5IHRoZXJlLgo+Pgo+IAo+IERpc2FibGluZyB0aGUgZ2xpdGNoIGZpbHRlciB3b3JrcyBsaWtl
IGEgY2hhcm0hIE90aGVyIGVudGh1c2lhc3RpYwo+IExpbnV4IHVzZXJzIHdobyBoYXZlIGJlZW4g
dHJvdWJsZWQgYnkgdGhpcyBpc3N1ZSBmb3IgbW9udGhzIHdvdWxkCj4gYWxzbyBmZWVsIGdyZWF0
IHRvIGtub3cgdGhpcyBzbWFsbCB0d2Vha2luZyBjb3VsZCBicmluZyB0aGVpcgo+IHRvdWNocGFk
IGJhY2sgdG8gbGlmZTopIFRoYW5rIHlvdSEKClRoYXQgaXMgZ29vZCB0byBoZWFyLCBJJ20gZ2xh
ZCB0aGF0IHdlIGhhdmUgZmluYWxseSBmb3VuZCBhIHNvbHV0aW9uLgoKPiAkIGdpdCBkaWZmCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jIGIvZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtYW1kLmMKPiBpbmRleCA5YTc2MGY1Y2Q3ZWQuLmU3ODZkNzc5ZDZjOCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hbWQuYwo+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9waW5jdHJsLWFtZC5jCj4gQEAgLTQ2Myw3ICs0NjMsNyBAQCBzdGF0aWMgaW50IGFt
ZF9ncGlvX2lycV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBl
KQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX3JlZyAmPSB+KEFDVElWRV9M
RVZFTF9NQVNLIDw8IEFDVElWRV9MRVZFTF9PRkYpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGluX3JlZyB8PSBBQ1RJVkVfTE9XIDw8IEFDVElWRV9MRVZFTF9PRkY7Cj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5fcmVnICY9IH4oREJfQ05UUmxfTUFTSyA8
PCBEQl9DTlRSTF9PRkYpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbl9yZWcg
fD0gREJfVFlQRV9QUkVTRVJWRV9ISUdIX0dMSVRDSCA8PCBEQl9DTlRSTF9PRkY7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoqIHBpbl9yZWcgfD0gREJfVFlQRV9QUkVTRVJWRV9I
SUdIX0dMSVRDSCA8PCBEQl9DTlRSTF9PRkY7ICovCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpcnFfc2V0X2hhbmRsZXJfbG9ja2VkKGQsIGhhbmRsZV9sZXZlbF9pcnEpOwo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gCj4gSSB3aWxsIGxlYXJuIG1v
cmUgYWJvdXQgdGhlIGdsaXRjaCBmaWx0ZXIgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IHBp
bmN0cmwgYW5kIHNlZSBpZiBJIGNhbiBkaXNhYmxlIGdsaXRjaCBmaWx0ZXIgb25seSBmb3IgdGhp
cyB0b3VjaHBhZC4KClRoZSBnbGl0Y2ggZmlsdGVyIGxpa2VseSBhbHNvIGhhcyBzZXR0aW5ncyBm
b3IgaG93IGxvbmcgYSBnbGl0Y2gKbGFzdHMsIHdoaWNoIGFwcGFyZW50bHkgZ29lcyBhbGwgdGhl
IHdheSB1cCB0byAxMjBtcy4gSWYgaXQgd291bGQKb25seSBkZWxheSByZXBvcnRpbmcgYnkgc2F5
IDAuMW1zIGFuZCBjb25zaWRlciBhbnkgcHVsc2UgbG9uZ2VyCnRoZW4gMC4xcyBub3QgYSBnbGl0
Y2gsIHRoZW4gaGF2aW5nIGl0IGVuYWJsZWQgd291bGQgYmUgZmluZS4KCkkgZG9uJ3QgdGhpbmsg
d2Ugd2FudCBzb21lIHNvcnQgb2YgcXVpcmsgaGVyZSB0byBvbmx5IGRpc2FibGUgdGhlCmdsaXRj
aCBmaWx0ZXIgZm9yIHNvbWUgdG91Y2hwYWRzLiBPbmUgYXBwcm9hY2ggbWlnaHQgYmUgdG8gc2lt
cGx5CmRpc2FibGUgaXQgY29tcGxldGVseSBmb3IgbGV2ZWwgdHlwZSBpcnFzLgoKV2hhdCB3ZSBy
ZWFsbHkgbmVlZCBoZXJlIGlzIHNvbWUgaW5wdXQgZnJvbSBBTUQgZW5naW5lZXJzIHdpdGggaG93
CnRoaXMgaXMgYWxsIHN1cHBvc2VkIHRvIHdvcmsuCgpFLmcuIG1heWJlIHRoZSBnbGl0Y2gtZmls
dGVyIGlzIHNldHVwIGJ5IHRoZSBCSU9TIGFuZCB3ZSBzaG91bGQgbm90CnRvdWNoIGl0IGFsbCA/
CgpPciBtYXliZSBpbnN0ZWFkIG9mIERCX1RZUEVfUFJFU0VSVkVfSElHSF9HTElUQ0ggbG93IGxl
dmVsIGludGVycnVwdHMKc2hvdWxkIHVzZSBEQl9UWVBFX1BSRVNFUlZFX0xPV19HTElUQ0ggPyAg
IFNvbWUgZG9jcyBmb3IgdGhlIGh3CndvdWxkIHJlYWxseSBoZWxwIGhlcmUgLi4uCgpSZWdhcmRz
LAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
