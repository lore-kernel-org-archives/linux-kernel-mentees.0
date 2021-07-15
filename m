Return-Path: <SRS0=ZtpW=MH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8233DC1B08C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 13:11:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A961613C4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 13:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A961613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E547C422A6;
	Thu, 15 Jul 2021 13:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4taVoXXk8tB; Thu, 15 Jul 2021 13:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 33D88422A5;
	Thu, 15 Jul 2021 13:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17156C0010;
	Thu, 15 Jul 2021 13:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8973CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 13:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA2F83DCA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 13:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7J0kxfyNwdf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 13:11:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89BF183DC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 13:11:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id t9so6239843pgn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mqqUIT6Gur6oNcZJ1XWtXgF8bqDE8LVYz2m/jR4Qhac=;
 b=mUHJFEeJ3iQSW5S3TDxP9BkECwt2+W+N5dt+izcX3VUjbVrJ3x9/fUwhP2HKX28trs
 +ymMx4/kdKhVdVxycOcUNHdAo7tbqjFKM9pCPjUe8YAf99vNkB9V8P3itd2ZF23JQxW0
 y3roMNVxfukO9SYMTNK7YB42aSb8HfMK0r4bObZ5zseJLKQrQpxeEak4EgG7QX2W12r1
 xxGmz0MXGhizFsxuxl7nMPfbYM3HzLYJiaJJ/zWH6I8ajQJonDpKgdZSyNtz7hvEUBfA
 LXqe4Z40gC64vCsG8LxrsGBh+y+VRO3KLp8S5PGzJZtcdAY2JdeeOa+kzR0ugqo8B4q/
 2uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mqqUIT6Gur6oNcZJ1XWtXgF8bqDE8LVYz2m/jR4Qhac=;
 b=ec+muMOw9plnfsd3rPVbhJNSBUrzsGN4YJPPUwMoLGiOVbHnSqf37lXIjCo6q/Qbn9
 ppZ1fwzgFIoVZ6D6Ep8kkCi3bF0aVfhv83RDEncAOw4Wv/xeYtS+r/X5grAqZ+apB/Gq
 CMS8DGq6oEaM5FB1ylKd1e1bJU4oNuZVA5AhVEONLv8KVaFvswRI7PqilBvMiW97PYgl
 9IztpFFhMSk5WMc6pp3KNNh4UKTvnBmOof4MpMoMtg90DpvhxTCy/wuxyqLBZbw3zPIl
 qMSzcxrmIKm48vzBnRSz2EvorBB6xkwzCXViolCdeig7nwBat+MyMva74rEGYrhmXzrr
 lj9w==
X-Gm-Message-State: AOAM532eIw1IhCZdJzgTfW0k1iYnspMlZVoMlOinQdSWccmohzJrqhON
 c6tTZf2jWMIkSgp3wlh9qVQ=
X-Google-Smtp-Source: ABdhPJzbQGwkKOCn3t2H9yhy5Rmtec/AnidC+GrfO1rZ7k/p/VcG736AZ8d3sHAOXDTLXUm8+XsSXg==
X-Received: by 2002:a05:6a00:1411:b029:302:d9d6:651d with SMTP id
 l17-20020a056a001411b0290302d9d6651dmr4618169pfu.56.1626354707982; 
 Thu, 15 Jul 2021 06:11:47 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id m34sm7528228pgb.85.2021.07.15.06.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:11:47 -0700 (PDT)
Subject: Re: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
To: Nikolay Borisov <nborisov@suse.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com
References: <20210715103403.176695-1-desmondcheongzx@gmail.com>
 <7ae7a858-9893-c41c-ed96-10651c295087@suse.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <b8fe8fa5-c022-187f-b10d-3f73e668008a@gmail.com>
Date: Thu, 15 Jul 2021 21:11:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7ae7a858-9893-c41c-ed96-10651c295087@suse.com>
Content-Language: en-US
Cc: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, anand.jain@oracle.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
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

T24gMTUvNy8yMSA3OjU1IHBtLCBOaWtvbGF5IEJvcmlzb3Ygd3JvdGU6Cj4gCj4gCj4gT24gMTUu
MDcuMjEg0LMuIDEzOjM0LCBEZXNtb25kIENoZW9uZyBaaGkgWGkgd3JvdGU6Cj4+IFN5emJvdCBy
ZXBvcnRzIGEgd2FybmluZyBpbiBjbG9zZV9mc19kZXZpY2VzIHRoYXQgaGFwcGVucyBiZWNhdXNl
Cj4+IGZzX2RldmljZXMtPnJ3X2RldmljZXMgaXMgbm90IDAgYWZ0ZXIgY2FsbGluZyBidHJmc19j
bG9zZV9vbmVfZGV2aWNlCj4+IG9uIGVhY2ggZGV2aWNlLgo+Pgo+PiBUaGlzIGhhcHBlbnMgd2hl
biBhIHdyaXRlYWJsZSBkZXZpY2UgaXMgcmVtb3ZlZCBpbgo+PiBfX2J0cmZzX2ZyZWVfZXh0cmFf
ZGV2aWRzLCBidXQgdGhlIHJ3IGRldmljZSBjb3VudCBpcyBub3QgZGVjcmVtZW50ZWQKPj4gYWNj
b3JkaW5nbHkuIFNvIHdoZW4gY2xvc2VfZnNfZGV2aWNlcyBpcyBjYWxsZWQsIHRoZSByZW1vdmVk
IGRldmljZSBpcwo+PiBzdGlsbCBjb3VudGVkIGFuZCB3ZSBnZXQgYW4gb2ZmIGJ5IDEgZXJyb3Iu
Cj4+Cj4+IEhlcmUgaXMgb25lIGNhbGwgdHJhY2UgdGhhdCB3YXMgb2JzZXJ2ZWQ6Cj4+ICAgIGJ0
cmZzX21vdW50X3Jvb3QoKToKPj4gICAgICBidHJmc19zY2FuX29uZV9kZXZpY2UoKToKPj4gICAg
ICAgIGRldmljZV9saXN0X2FkZCgpOyAgIDwtLS0tLS0tLS0tLS0tLS0tIGRldmljZSBhZGRlZAo+
PiAgICAgIGJ0cmZzX29wZW5fZGV2aWNlcygpOgo+PiAgICAgICAgb3Blbl9mc19kZXZpY2VzKCk6
Cj4+ICAgICAgICAgIGJ0cmZzX29wZW5fb25lX2RldmljZSgpOyAgIDwtLS0tLS0tLSBydyBkZXZp
Y2UgY291bnQgKysKPj4gICAgICBidHJmc19maWxsX3N1cGVyKCk6Cj4+ICAgICAgICBvcGVuX2N0
cmVlKCk6Cj4+ICAgICAgICAgIGJ0cmZzX2ZyZWVfZXh0cmFfZGV2aWRzKCk6Cj4+IAkgIF9fYnRy
ZnNfZnJlZV9leHRyYV9kZXZpZHMoKTsgIDwtLS0gZGV2aWNlIHJlbW92ZWQKPj4gCSAgZmFpbF90
cmVlX3Jvb3RzOgo+PiAJICAgIGJ0cmZzX2Nsb3NlX2RldmljZXMoKToKPj4gCSAgICAgIGNsb3Nl
X2ZzX2RldmljZXMoKTsgICA8LS0tLS0tLSBydyBkZXZpY2UgY291bnQgb2ZmIGJ5IDEKPj4KPj4g
Rml4ZXM6IGNmODlhZjE0NmI3ZSAoImJ0cmZzOiBkZXYtcmVwbGFjZTogZmFpbCBtb3VudCBpZiB3
ZSBkb24ndCBoYXZlIHJlcGxhY2UgaXRlbSB3aXRoIHRhcmdldCBkZXZpY2UiKQo+PiBSZXBvcnRl
ZC1ieTogc3l6Ym90K2E3MGUyYWQwODc5ZjE2MGI5MjE3QHN5emthbGxlci5hcHBzcG90bWFpbC5j
b20KPj4gVGVzdGVkLWJ5OiBzeXpib3QrYTcwZTJhZDA4NzlmMTYwYjkyMTdAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQo+PiBTaWduZWQtb2ZmLWJ5OiBEZXNtb25kIENoZW9uZyBaaGkgWGkgPGRl
c21vbmRjaGVvbmd6eEBnbWFpbC5jb20+Cj4gCj4gSXMgdGhlcmUgYSByZWxpYWJsZSByZXByb2R1
Y2VyIGZyb20gc3l6Ym90PyBDYW4gdGhpcyBiZSB0dXJuZWQgaW50byBhbgo+IHhmc3Rlc3Q/Cj4g
CgpTeXpib3QgaGFzIHNvbWUgcmVsaWFibGUgcmVwcm9kdWNlcnMgaGVyZToKaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTExM2Q5YTAxY2JlMGFmM2UyOTE2MzNiYTdhN2EzZTk4
M2I4NmMzYzAKClNlZW1zIGxpa2UgaXQgY29uc3RydWN0cyB0d28gaW1hZ2VzIGluLW1lbW9yeSB0
aGVuIG1vdW50cyB0aGVtLiBJJ20gbm90IApzdXJlIGlmIHRoYXQncyBhbWVuYWJsZSB0byBiZSBj
b252ZXJ0ZWQgaW50byBhbiB4ZnN0ZXN0PwoKPj4gLS0tCj4+ICAgZnMvYnRyZnMvdm9sdW1lcy5j
IHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9mcy9idHJmcy92b2x1bWVzLmMgYi9mcy9idHJmcy92b2x1bWVzLmMKPj4gaW5kZXggODA3
NTAyY2Q2NTEwLi45MTZjMjUzNzE2NTggMTAwNjQ0Cj4+IC0tLSBhL2ZzL2J0cmZzL3ZvbHVtZXMu
Ywo+PiArKysgYi9mcy9idHJmcy92b2x1bWVzLmMKPj4gQEAgLTEwNzgsNiArMTA3OCw3IEBAIHN0
YXRpYyB2b2lkIF9fYnRyZnNfZnJlZV9leHRyYV9kZXZpZHMoc3RydWN0IGJ0cmZzX2ZzX2Rldmlj
ZXMgKmZzX2RldmljZXMsCj4+ICAgCQlpZiAodGVzdF9iaXQoQlRSRlNfREVWX1NUQVRFX1dSSVRF
QUJMRSwgJmRldmljZS0+ZGV2X3N0YXRlKSkgewo+PiAgIAkJCWxpc3RfZGVsX2luaXQoJmRldmlj
ZS0+ZGV2X2FsbG9jX2xpc3QpOwo+PiAgIAkJCWNsZWFyX2JpdChCVFJGU19ERVZfU1RBVEVfV1JJ
VEVBQkxFLCAmZGV2aWNlLT5kZXZfc3RhdGUpOwo+PiArCQkJZnNfZGV2aWNlcy0+cndfZGV2aWNl
cy0tOwo+PiAgIAkJfQo+PiAgIAkJbGlzdF9kZWxfaW5pdCgmZGV2aWNlLT5kZXZfbGlzdCk7Cj4+
ICAgCQlmc19kZXZpY2VzLT5udW1fZGV2aWNlcy0tOwo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
