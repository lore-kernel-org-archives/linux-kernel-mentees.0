Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD20C47095
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 22:08:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B3F206F8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 22:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBnjRal1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B3F206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AB4585B8A;
	Sat,  3 Oct 2020 22:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QV4i+AYakI5; Sat,  3 Oct 2020 22:08:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74A2985721;
	Sat,  3 Oct 2020 22:08:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AF6FC0889;
	Sat,  3 Oct 2020 22:08:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 704DCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 62C1785B8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrpCeyQGiltQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 22:08:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F79F85721
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 22:08:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u24so3283850pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K7prn+OySA9dsDPOdM/Xq3Uxq9GhNO6pfnjq7gcgnBM=;
 b=SBnjRal1k9R0s2/i3bXCb0PMhTx3D6dT9Kf78kMqTIg7IrSLNp/IpQqeWrisPZ2yvD
 nnc/HcLp03ktgfYVXQ3rP3Gh0SNnfH5vAQ+yBCgCH94TlJKIsCQ+lYBle/zXJWDe8ZD0
 clwC/+Oo/rC5hK+P9DVjNqbruAFwGKvs1rcxC8ckKfm2/o/LWofTlUyIfTS7NuP8JAXl
 zry7RbAYiBmtjphf23GXLNx4pXZ3YfANLrHOwaqsVQBT5gzh9xiBJ2cha6VvR3se0Mxx
 44S+S5m3X6dyAlJmh2KXKThfxJKc1ex7gWbK56ndmvc3UiSNGx7RrQOdrnBlo8xfUh3y
 DwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K7prn+OySA9dsDPOdM/Xq3Uxq9GhNO6pfnjq7gcgnBM=;
 b=I4Z+wNeCcmMcdsh4R3O2k8JNw6P50HkyyeGICi/Q72xe9Cqjnb7yG4QCiLRR8NM53k
 4v3EPTp9MXLesV+BDYx+iE4DSQM9BfVlN5t0eeflDTUlQqN66SZx3okkOiw6h3MHWR44
 VVGNQK4cI16VQwWQF5/zSU9qEtSUIHxWJcshYAhCjm+LR74exDMR5fgShBT/SNSyqMAy
 O3SYQjsHaSCqKxNAFCQH0WSeqb/43btREoMJvjfmCpD07v/rP+t/JOwQXoRzlKg/YYhq
 +dxowhhyiC+8uy92p/3o9EBzHudZHRSExufTIAhyMtDGglM4CXkTMaFsanQp/g8WxFG1
 81sQ==
X-Gm-Message-State: AOAM533I5h3GM0t7aRP8LZ6vpLuIkcIrgm8myv7vm471+xpI30dzkAgt
 DNmKBYP44NFjojaq32+kUDI=
X-Google-Smtp-Source: ABdhPJz27UI1n/OwASkq+l9PBfvnArPfn7FK4DrS9UteyGak86q9+UJctpK1rdhYlHRAZT7DQ/OGcQ==
X-Received: by 2002:a05:6a00:23cc:b029:142:2501:34e5 with SMTP id
 g12-20020a056a0023ccb0290142250134e5mr9491367pfc.62.1601762879292; 
 Sat, 03 Oct 2020 15:07:59 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id v2sm6392108pfu.105.2020.10.03.15.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 15:07:58 -0700 (PDT)
To: Hans de Goede <hdegoede@redhat.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
 <33d8c103-0c24-3ad7-2a3c-ffeb625521ee@redhat.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <53d30b50-6cd4-57b2-9dc7-8cb8109ff7ab@gmail.com>
Date: Sun, 4 Oct 2020 03:37:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33d8c103-0c24-3ad7-2a3c-ffeb625521ee@redhat.com>
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] bluetooth: hci_h5: close
 serdev device and free hu in h5_close
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

Ck9uIDAyLzEwLzIwIDM6NTIgcG0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGksCj4KPiBPbiAx
MC8xLzIwIDk6NDMgUE0sIEFuYW50IFRoYXpoZW1hZGFtIHdyb3RlOgo+PiBXaGVuIGg1X2Nsb3Nl
KCkgZ2V0cyBjYWxsZWQsIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGZvciB0aGUgaHUgZ2V0cwo+PiBm
cmVlZCBvbmx5IGlmIGh1LT5zZXJkZXYgZG9lc24ndCBleGlzdC4gVGhpcyBsZWFkcyB0byBhIG1l
bW9yeSBsZWFrLgo+PiBTbyB3aGVuIGg1X2Nsb3NlKCkgaXMgcmVxdWVzdGVkLCBjbG9zZSB0aGUg
c2VyZGV2IGRldmljZSBpbnN0YW5jZSBhbmQKPj4gZnJlZSB0aGUgbWVtb3J5IGFsbG9jYXRlZCB0
byB0aGUgaHUgZW50aXJlbHkgaW5zdGVhZC4KPj4KPj4gRml4ZXM6IGNlOTQ1NTUyZmRlNCAoIkJs
dWV0b290aDogaGNpX2g1OiBBZGQgc3VwcG9ydCBmb3Igc2VyZGV2IGVudW1lcmF0ZWQgZGV2aWNl
cyIpCj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNmNlMTQxYzU1YjJmN2FhZmQxYzRAc3l6a2FsbGVy
LmFwcHNwb3RtYWlsLmNvbQo+PiBUZXN0ZWQtYnk6IHN5emJvdCs2Y2UxNDFjNTViMmY3YWFmZDFj
NEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+IFNpZ25lZC1vZmYtYnk6IEFuYW50IFRoYXpo
ZW1hZGFtIDxhbmFudC50aGF6aGVtYWRhbUBnbWFpbC5jb20+Cj4KPiBTbyAyIGNvbW1lbnRzIHRv
IHRoaXM6Cj4KPiAxLiBZb3UgY2xhaW0gdGhpcyBjaGFuZ2UgZml4ZXMgYSBtZW1vcnktbGVhaywg
YnV0IGluIHRoZSBzZXJkZXYgY2FzZQo+IHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkIGluIGg1X3Nl
cmRldl9wcm9iZSgpIGxpa2UgdGhpczoKPgo+IMKgwqDCoMKgwqDCoCBoNSA9IGRldm1fa3phbGxv
YyhkZXYsIHNpemVvZigqaDUpLCBHRlBfS0VSTkVMKTsKPgo+IFNvIGl0cyBsaWZldGltZSBpcyB0
aWVkIHRvIHRoZSBsaWZldGltZSBvZiB0aGUgZHJpdmVyIGJlaW5nIGJvdW5kCj4gdG8gdGhlIHNl
cmRldiBhbmQgaXQgaXMgYXV0b21hdGljYWxseSBmcmVlZCB3aGVuIHRoZSBkcml2ZXIgZ2V0cwo+
IHVuYm91bmQuIElmIHlvdSBoYWQgbG9va2VkIGF0IHdoZXJlIHRoZSBoNSBzdHJ1Y3QgZ2V0cyBh
bGxvY2F0ZWQKPiBpbiBoNV9jbG9zZSgpLXMgY291bnRlcnBhcnQsIGg1X29wZW4oKSB0aGVuIHlv
dSBjb3VsZCBoYXZlIHNlZW4KPiB0aGlzIHRoZXJlOgo+Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKGh1
LT5zZXJkZXYpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaDUgPSBzZXJkZXZf
ZGV2aWNlX2dldF9kcnZkYXRhKGh1LT5zZXJkZXYpOwo+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGg1ID0ga3phbGxvYyhzaXplb2YoKmg1
KSwgR0ZQX0tFUk5FTCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaDUp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVOT01FTTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4KPiBTbyBpdCBpcyB2ZXJ5IGNsZWFyIGhlcmUs
IHRoYXQgdGhlIGt6YWxsb2Mgb25seSBoYXBwZW5zIGluIHRoZQo+IGlmICghaHUtPnNlcmRldikg
d2hpY2ggY2xlYXJseSBtYWtlcyB0aGUga2ZyZWUoKSBoYXZlIHRoZSBzYW1lCj4gY29uZGl0aW9u
IHRoZSByaWdodCB0aGluZyB0b2RvLiBJbiB0aGUgaHUtPnNlcmRldiB0aGUgZGF0YSB3aGljaAo+
IHdhcyBhbGxvY2F0ZWQgYnkgaDVfc2VyZGV2X3Byb2JlKCkgaXMgdXNlZCBpbnN0ZWFkIGFuZCBu
byBhbGxvYwo+IGhhcHBlbnMgaW5zaWRlIGg1X29wZW4oKQo+Cj4gSW4gZ2VuZXJhbCB3aGVuIGxv
b2tpbmcgYXQgcmVzb3VyY2UgdGVhcmRvd24geW91IHNob3VsZCBhbHNvIGxvb2sKPiBhdCB3aGVy
ZSB0aGV5IGFyZSBhbGxvY2F0ZWQgaW4gdGhlIG1pcnJvciBmdW5jdGlvbgo+IGFuZCB0aGUgdGVh
cmRvd24gc2hvdWxkIG1pcnJvciB0aGUgYWxsb2MgY29kZS4KPgo+IFNvIHRoZSBtYWluIGNoYW5n
ZSBvZiB5b3VyIGNvbW1pdCBpcyB3cm9uZzoKPgo+IE5BQ0suCj4KPgo+IDIuIFlvdSBhcmUgbWFr
aW5nIG11bHRpcGxlIGNoYW5nZXMgaW4gYSBzaW5nbGUgY29tbWl0IGhlcmUsIEkgY291bnQgYXQK
PiBsZWFzdCAzLiBXaGVuIGV2ZXIgeW91IGFyZSBtYWtpbmcgbXVsdGlwbGUgY2hhbmdlcyBsaWtl
IHRoaXMsIHlvdSBzaG91bGQgcmVhbGx5Cj4gc3BsaXQgdGhlIGNvbW1pdCB1cCBpbiAxIGNvbW1p
dCBwZXIgY2hhbmdlIGFuZCBleHBsYWluIGluIGVhY2ggY29tbWl0Cj4gbWVzc2FnZSB3aHkgdGhh
dCBjaGFuZ2UgaXMgYmVpbmcgbWFkZSAod2h5IGl0IGlzIG5lY2Vzc2FyeSkuIFdyaXRpbmcKPiBj
b21taXQgbWVzc2FnZXMgbGlrZSB0aGlzIGFsc28gbGVhZHMgdG8geW91IGRvdWJsZS1jaGVja2lu
ZyB5b3VyIG93bgo+IHdvcmsgYnkgY2FyZWZ1bGx5IGNvbnNpZGVyaW5nIHdoeSB5b3UgYXJlIG1h
a2luZyB0aGUgY2hhbmdlcy4KPgo+IFNvIGFib3V0IHRoZSAzIGRpZmZlcmVudCBjaGFuZ2VzOgo+
Cj4gMmEpIE1ha2UgdGhlIGtmcmVlKGg1KSBjYWxsIHVuY29uZGl0aW9uYWxseSwgd2hpY2ggYXMg
bWVudGlvbmVkIGFib3ZlCj4gaXMgd3JvbmcuCj4KPiAyYikgSW50cm9kdWNlIGEgY2FsbCB0byBr
ZnJlZV9za2IoaDUtPnJ4X3NrYik7IHdoaWNoIGlzIG5vdCBtZW50aW9uZWQgaW4KPiB0aGUgY29t
bWl0IG1lc3NhZ2UgYXQgYWxsLsKgIFRoaXMgbG9va3MgbGlrZSBpdCB3b3VsZCBhY3R1YWxseSBi
ZSBhIHNlbnNpYmxlCj4gY2hhbmdlLCBhdCBsZWFzdCBpbiB0aGUgImlmICghaHUtPnNlcmRldiki
IGNhc2UuwqAgV2hlbiB1c2luZyB0aGUgc2VyZGV2Cj4gaW50ZXJmYWNlIHRoZW4ganVzdCBmcmVl
aW5nIGl0IHdpbGwgbGVhdmUgYSBkYW5nbGluZyBwb2ludGVyLCBzbyBpdAo+IHdvdWxkIGJlIGJl
dHRlciAoZm9yIGJvdGggdGhlIGh1LT5zZXJkZXYgYW5kIHRoZSAhaHUtPnNlcmRldiBjYXNlcykK
PiB0byBjYWxsIGg1X3Jlc2V0X3J4KCkgb24gY2xvc2UgaW5zdGVhZCB3aGljaCBkb2VzOgo+Cj4g
wqDCoMKgwqDCoMKgwqAgaWYgKGg1LT5yeF9za2IpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAga2ZyZWVfc2tiKGg1LT5yeF9za2IpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBoNS0+cnhfc2tiID0gTlVMTDsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4KPiAyYykgSW50
cm9kdWNlIGEgY2FsbCB0byBzZXJkZXZfZGV2aWNlX2Nsb3NlKCksIHdpdGhvdXQgcmVhbGx5IGV4
cGxhaW5pbmcKPiB3aHkgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBBZ2FpbiBpZiB5b3Ugd291bGQg
aGF2ZSBsb29rZWQgYXQgdGhlIG1pcnJvcgo+IGg1X2Nsb3NlKCkgZnVuY3Rpb24gdGhlbiB5b3Ug
c2VlIG5vIHNlcmRldl9kZXZpY2Vfb3BlbigpIHRoZXJlLgo+IEFjdHVhbGx5IHNlcmRldl9kZXZp
Y2Vfb3BlbigpIGlzIG5vdCBjYWxsZWQgYW55d2hlcmUgaW4gdGhlIGhjaV9oNS5jIGNvZGUuCj4K
PiBEaWdnaW5nIGEgbGl0dGxlIGRlZXBlciAodXNpbmcgZ3JlcCkgc2hvd3MgdGhhdCBoY2lfdWFy
dF9yZWdpc3Rlcl9kZXZpY2UoKQo+IGNhbGxzIHNlcmRldl9kZXZpY2Vfb3BlbigpIGFuZCBoY2lf
dWFydF9yZWdpc3Rlcl9kZXZpY2UoKSBnZXRzIGNhbGxlZCBmcm9tOgo+IGg1X3NlcmRldl9wcm9i
ZSgpLCBsaWtld2lzZSBoY2lfdWFydF91bnJlZ2lzdGVyX2RldmljZSgpIGNhbGxzCj4gc2VyZGV2
X2RldmljZV9jbG9zZSgpIGZvciB1cyBhbmQgdGhhdCBnZXRzIGNhbGxlZCBmcm9tIGg1X3NlcmRl
dl9yZW1vdmUoKSwKPiBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGNhbGwgc2VyZGV2X2RldmljZV9j
bG9zZSgpIGZyb20gaDVfY2xvc2UoKSBhbmQgZG9pbmcKPiBzbyB3aWxsIGFjdHVhbGx5IGJyZWFr
IHRoaW5ncywgYmVjYXVzZSB0aGVuIHRoZSBzZXJkZXYgd2lsbCBiZSBsZWZ0IGNsb3NlZAo+IG9u
IGEgc3Vic2VxdWVudCBoNV9vcGVuKCkgY2FsbC4KPgo+IFJlZ2FyZHMsCj4KPiBIYW5zCj4KSGks
CgpJIGRpZCBzb21lIG1vcmUgaW52ZXN0aWdhdGluZyBhbmQgdGVzdGluZyBmb3IgdGhpcyBidWcs
IGFuZCB0dXJucyBvdXQgSSB3YXMgdmVyeQp3cm9uZy4gSSdtIHRydWx5IHNvcnJ5IGZvciB0aGF0
LgoKVGhlIG1lbW9yeSBsZWFrIHRoYXQgaXMgY2F1c2VkIGlzIGNhdXNlZCB3aGVuICFodS0+c2Vy
ZGV2IGl0c2VsZiwgc2luY2Ugd2UgZnJlZQpoNSwgYnV0IG5vdCBoNS0+cnhfc2tiLiBUaGlzIGlz
IHdoYXQgY2F1c2VzIHRoZSBtZW1vcnkgbGVhay4KCkknbGwgc2VuZCBpbiBhIHYzIHRoYXQgY29y
cmVjdHMgdGhpcyBpc3N1ZSBzb29uIGVub3VnaCwgYnkgZnJlZWluZyBoNS0+cnhfc2tiIGZpcnN0
CmZvbGxvd2VkIGJ5IGg1IHdoZW4gIWh1LT5zZXJkZXY7IGFuZCBvdGhlcndpc2UgKHdoZW4gaHUt
PnNlcmRldiBleGlzdHMpCmNhbGxpbmcgaDVfcmVzZXRfcngoKS4KClNvcnJ5IGZvciB0aGUgdHJv
dWJsZS4KClRoYW5rcywKQW5hbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
