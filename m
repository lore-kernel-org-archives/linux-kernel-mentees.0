Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5443C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:14:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 173BB208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/kAX/pv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 173BB208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77F1187A4C;
	Wed, 14 Oct 2020 13:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XKvPukEua8p; Wed, 14 Oct 2020 13:14:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10AD787870;
	Wed, 14 Oct 2020 13:14:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 023F9C07FF;
	Wed, 14 Oct 2020 13:14:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 302E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1ECC187D84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRzNbaLWKw6b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:14:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 927C487D7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:14:12 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j18so1985992pfa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UawW9kr1VSlFsZgDsJocSNaJ6Xn7ZSJWICbrc18ExZo=;
 b=f/kAX/pvagRkeIdnKXg+eLk1YQEk8AEaSMO4v/LAVYvP9aXQ7OTpenGA2Rt5D3rPdz
 9bos2WL/Li5bhZSEKkSLHSRWQh9fdnr2OkZnrZrcp7Z94LP8r3maCBQFCFYHdrTilqE1
 Xg/nHZJlGyNPZTsYoKnN+oQGmixOkHfnOywaqQqyzN6v0tLpxFX1KopZ4VpYO6Myf7e6
 JsrCEYpJmqWTwVqQFnifj86I7K7zAybo3a3Cjg+1aMkqNb/JQrezvJQa3jaV7Ngp5k9o
 h1A5SEjXvly0shYu332fHNUlFNUCp8ZSJVg3d8iLBA1BonYHZJBefZYHdrw5NzITkeod
 F80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UawW9kr1VSlFsZgDsJocSNaJ6Xn7ZSJWICbrc18ExZo=;
 b=IsrMdEvWhPpU6aHyxDkQ15w+/GEAPPF1Km68djgE/MdC1pxxc/ETOQ2s4AkJZcWZuR
 zl5VwMq3dr66xBa92LOR8T0RF/5gd3ZvDlGpWj8uZvtSHsuKG/FXVnM0Gx/V+Q8hl43z
 C0PviUJkbz/1cfluUIbpIpnLPq1oeEK900OwlnS3+gZ3YRGZHgD2MlSUMiOUpza1IHkM
 uEdAQDuKtUh0/NYFtjio4wty/DV0Sx7r+oMJ2k/LVGf6AySF/fgzl228G1OFEQ7f4UcR
 j7IFXv+KeqTXIRTozCz65Re6hZu1iuZsmu2lhTaliAaBMMBXy+HGki2QUQrhDXjspToi
 p08A==
X-Gm-Message-State: AOAM532DTA9Hj+gjRgpJn+K4SGMfjR0wlDBKAGDc1pyRJP6caEmNhcOE
 FIFKnzm/7KKrB9+aMSIbCAA=
X-Google-Smtp-Source: ABdhPJworPLHLh5PTrbbUgBQX2HKwQrgckVM4USyKQLbZcOTMHSKev+j9cMneIwyEplnuMSOiDJ0Hg==
X-Received: by 2002:aa7:9358:0:b029:152:b349:8af8 with SMTP id
 24-20020aa793580000b0290152b3498af8mr4352952pfn.9.1602681251951; 
 Wed, 14 Oct 2020 06:14:11 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.205.44])
 by smtp.gmail.com with ESMTPSA id p6sm3327907pjd.1.2020.10.14.06.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 06:14:11 -0700 (PDT)
To: Andrew Price <anprice@redhat.com>
References: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
 <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <48a1f8ca-54ce-09f4-45c2-b1091d4e358a@gmail.com>
Date: Wed, 14 Oct 2020 18:44:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
Content-Language: en-US
Cc: agruenba@redhat.com, Fox Chen <foxhlchen@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, rpeterso@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [Cluster-devel] [PATCH] fs: gfs2:
 prevent OOB access in gfs2_read_sb()
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

Ck9uIDE0LzEwLzIwIDY6MzQgcG0sIEFuZHJldyBQcmljZSB3cm90ZToKPiBPbiAxMy8xMC8yMDIw
IDE2OjI2LCBBbmFudCBUaGF6aGVtYWRhbSB3cm90ZToKPj4gSW4gZ2ZzMl9yZWFkX3NiKCksIGlm
IHRoZSBjb25kaXRpb24KPj4gwqDCoMKgwqAoZCAhPSBzZHAtPnNkX2hlaWdodHNpemVbeCAtIDFd
IHx8IG0pCj4+IGlzbid0IHNhdGlzZmllZCAoaW4gdGhlIGZpcnN0IDExIGl0ZXJhdGlvbnMpLCB0
aGUgbG9vcCBjb250aW51ZXMsCj4+IGFuZCBiZWdpbnMgdG8gcGVyZm9ybSBvdXQtb2YtYm91bmRz
IGFjY2Vzcy4KPj4gRml4IHRoaXMgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgYnkgaW50cm9kdWNpbmcg
YSBjb25kaXRpb24gaW4gdGhlIGZvciBsb29wCj4+IHRoYXQgZW5zdXJlcyB0aGF0IG5vIG1vcmUg
dGhhbiBHRlMyX01BWF9NRVRBX0hFSUdIVCArIDEgZWxlbWVudHMgYXJlCj4+IGFjY2Vzc2VkLgo+
Pgo+PiBJbiBhZGRpdGlvbiB0byB0aGlzLCBpZiB0aGUgYWJvdmUgY29uZGl0aW9uIGlzIHNhdGlz
ZmllZCB3aGVuCj4+IHggPSBHRlMyX01BWF9NRVRBX0hFSUdIVCAod2hpY2ggPSAxMCksIGFuZCB0
aGUgZmxvdyBvZiBjb250cm9sIGJyZWFrcwo+PiBvdXQgb2YgdGhlIGxvb3AsIHRoZW4gYW4gb3V0
LW9mLWJvdW5kcyBhY2Nlc3MgaXMgcGVyZm9ybWVkIGFnYWluIHdoaWxlCj4+IGFzc2lnbmluZyBz
ZHAtPnNkX2hlaWdodHNpemVbeF0gPSB+MCAoc2luY2UgeCB3b3VsZCBiZSAxMSBub3cuKSwgYW5k
Cj4+IGFsc28gdGhlIGFzc2VydGlvbiB0aGF0IHNwZC0+c2RfbWF4X2hlaWdodCA8PSBHRlMyX01B
WF9NRVRBX0hFSUdIVCB3b3VsZAo+PiBmYWlsLgo+PiBGaXggdGhpcyBvdXQtb2YtYm91bmRzIGFj
Y2VzcyBhbmQgZW5zdXJlIHRoYXQgdGhlIGFzc2VydGlvbiBkb2Vzbid0IGZhaWwKPj4gYnkgaW50
cm9kdWNpbmcgYW5vdGhlciB2YXJpYWJsZSAiaW5kZXgiLCB3aGljaCBrZWVwcyB0cmFjayBvZiB0
aGUgbGFzdAo+PiB2YWxpZCB2YWx1ZSBvZiB4IChwcmUtaW5jcmVtZW50KSB0aGF0IGNhbiBiZSB1
c2VkLgo+Cj4gVGhhdCdzIG5vdCBxdWl0ZSB0aGUgcmlnaHQgYXBwcm9hY2guIFlvdXIgYW5hbHlz
aXMgYmVsb3cgaXMgY29ycmVjdDogdGhlIHByb2JsZW0gc3RlbXMgZnJvbSB0aGUgYmxvY2sgc2l6
ZSBpbiB0aGUgc3VwZXJibG9jayBiZWluZyB6ZXJvZWQgYnkgdGhlIGZ1enplci4gU28gdGhlIGNv
cnJlY3QgZml4IHdvdWxkIGJlIHRvIGFkZCBhIHZhbGlkYXRpb24gY2hlY2sgZm9yIHNiX2JzaXpl
IChnZnMyX2NoZWNrX3NiKCkgaXMgbGFja2luZyBzb21ld2hhdCkuIFZhbGlkIHZhbHVlcyBhcmUg
cG93ZXJzIG9mIDIgYmV0d2VlbiA1MTIgYW5kIHRoZSBwYWdlIHNpemUuCj4KCkkgc2VlLiBUaGFu
a3MgZm9yIHRoZSByZXZpZXchIEknbGwgc2VuZCBpbiBhIHYyIHRoYXQgaW1wbGVtZW50cyB0aGlz
IGNoZWNrIHNvb24gZW5vdWdoLgoKVGhhbmtzLApBbmFudAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
