Return-Path: <SRS0=ZtpW=MH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C78C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 11:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EF76117A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 11:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EF76117A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1BA440643;
	Thu, 15 Jul 2021 11:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYs7zJbgS7GP; Thu, 15 Jul 2021 11:55:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EEE2E400BA;
	Thu, 15 Jul 2021 11:55:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5546C001A;
	Thu, 15 Jul 2021 11:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03EC6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 11:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D6B83D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 11:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zl2lDx_pbkG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 11:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD8483D55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 11:55:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 301CA22A08;
 Thu, 15 Jul 2021 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626350138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0P5XBtGFEFlf02xC8Z0PQcajQCMzXtZPbZNkfbQBcI=;
 b=On8ITqXY3szBMaOX4uyA4mLGdeqWiLBEJK/Dfbpk0iOHe67oFS8jJkY7RhH9+GAiKVIiZX
 kwZu43aCGJV7C5ru5FBwFpqyW3aiJcF0wWH8pURBySyyElQwtxig2znzBtFS3g600x033z
 pTB44ZWTcSGA6jkIXBdp0ZGwc4E5OlQ=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9D62F13D7E;
 Thu, 15 Jul 2021 11:55:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id WyiAIzki8GDdNAAAGKfGzw
 (envelope-from <nborisov@suse.com>); Thu, 15 Jul 2021 11:55:37 +0000
Subject: Re: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com
References: <20210715103403.176695-1-desmondcheongzx@gmail.com>
Message-ID: <7ae7a858-9893-c41c-ed96-10651c295087@suse.com>
Date: Thu, 15 Jul 2021 14:55:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715103403.176695-1-desmondcheongzx@gmail.com>
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
From: Nikolay Borisov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Nikolay Borisov <nborisov@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CgpPbiAxNS4wNy4yMSDQsy4gMTM6MzQsIERlc21vbmQgQ2hlb25nIFpoaSBYaSB3cm90ZToKPiBT
eXpib3QgcmVwb3J0cyBhIHdhcm5pbmcgaW4gY2xvc2VfZnNfZGV2aWNlcyB0aGF0IGhhcHBlbnMg
YmVjYXVzZQo+IGZzX2RldmljZXMtPnJ3X2RldmljZXMgaXMgbm90IDAgYWZ0ZXIgY2FsbGluZyBi
dHJmc19jbG9zZV9vbmVfZGV2aWNlCj4gb24gZWFjaCBkZXZpY2UuCj4gCj4gVGhpcyBoYXBwZW5z
IHdoZW4gYSB3cml0ZWFibGUgZGV2aWNlIGlzIHJlbW92ZWQgaW4KPiBfX2J0cmZzX2ZyZWVfZXh0
cmFfZGV2aWRzLCBidXQgdGhlIHJ3IGRldmljZSBjb3VudCBpcyBub3QgZGVjcmVtZW50ZWQKPiBh
Y2NvcmRpbmdseS4gU28gd2hlbiBjbG9zZV9mc19kZXZpY2VzIGlzIGNhbGxlZCwgdGhlIHJlbW92
ZWQgZGV2aWNlIGlzCj4gc3RpbGwgY291bnRlZCBhbmQgd2UgZ2V0IGFuIG9mZiBieSAxIGVycm9y
Lgo+IAo+IEhlcmUgaXMgb25lIGNhbGwgdHJhY2UgdGhhdCB3YXMgb2JzZXJ2ZWQ6Cj4gICBidHJm
c19tb3VudF9yb290KCk6Cj4gICAgIGJ0cmZzX3NjYW5fb25lX2RldmljZSgpOgo+ICAgICAgIGRl
dmljZV9saXN0X2FkZCgpOyAgIDwtLS0tLS0tLS0tLS0tLS0tIGRldmljZSBhZGRlZAo+ICAgICBi
dHJmc19vcGVuX2RldmljZXMoKToKPiAgICAgICBvcGVuX2ZzX2RldmljZXMoKToKPiAgICAgICAg
IGJ0cmZzX29wZW5fb25lX2RldmljZSgpOyAgIDwtLS0tLS0tLSBydyBkZXZpY2UgY291bnQgKysK
PiAgICAgYnRyZnNfZmlsbF9zdXBlcigpOgo+ICAgICAgIG9wZW5fY3RyZWUoKToKPiAgICAgICAg
IGJ0cmZzX2ZyZWVfZXh0cmFfZGV2aWRzKCk6Cj4gCSAgX19idHJmc19mcmVlX2V4dHJhX2Rldmlk
cygpOyAgPC0tLSBkZXZpY2UgcmVtb3ZlZAo+IAkgIGZhaWxfdHJlZV9yb290czoKPiAJICAgIGJ0
cmZzX2Nsb3NlX2RldmljZXMoKToKPiAJICAgICAgY2xvc2VfZnNfZGV2aWNlcygpOyAgIDwtLS0t
LS0tIHJ3IGRldmljZSBjb3VudCBvZmYgYnkgMQo+IAo+IEZpeGVzOiBjZjg5YWYxNDZiN2UgKCJi
dHJmczogZGV2LXJlcGxhY2U6IGZhaWwgbW91bnQgaWYgd2UgZG9uJ3QgaGF2ZSByZXBsYWNlIGl0
ZW0gd2l0aCB0YXJnZXQgZGV2aWNlIikKPiBSZXBvcnRlZC1ieTogc3l6Ym90K2E3MGUyYWQwODc5
ZjE2MGI5MjE3QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBUZXN0ZWQtYnk6IHN5emJvdCth
NzBlMmFkMDg3OWYxNjBiOTIxN0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gU2lnbmVkLW9m
Zi1ieTogRGVzbW9uZCBDaGVvbmcgWmhpIFhpIDxkZXNtb25kY2hlb25nenhAZ21haWwuY29tPgoK
SXMgdGhlcmUgYSByZWxpYWJsZSByZXByb2R1Y2VyIGZyb20gc3l6Ym90PyBDYW4gdGhpcyBiZSB0
dXJuZWQgaW50byBhbgp4ZnN0ZXN0PwoKPiAtLS0KPiAgZnMvYnRyZnMvdm9sdW1lcy5jIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9i
dHJmcy92b2x1bWVzLmMgYi9mcy9idHJmcy92b2x1bWVzLmMKPiBpbmRleCA4MDc1MDJjZDY1MTAu
LjkxNmMyNTM3MTY1OCAxMDA2NDQKPiAtLS0gYS9mcy9idHJmcy92b2x1bWVzLmMKPiArKysgYi9m
cy9idHJmcy92b2x1bWVzLmMKPiBAQCAtMTA3OCw2ICsxMDc4LDcgQEAgc3RhdGljIHZvaWQgX19i
dHJmc19mcmVlX2V4dHJhX2RldmlkcyhzdHJ1Y3QgYnRyZnNfZnNfZGV2aWNlcyAqZnNfZGV2aWNl
cywKPiAgCQlpZiAodGVzdF9iaXQoQlRSRlNfREVWX1NUQVRFX1dSSVRFQUJMRSwgJmRldmljZS0+
ZGV2X3N0YXRlKSkgewo+ICAJCQlsaXN0X2RlbF9pbml0KCZkZXZpY2UtPmRldl9hbGxvY19saXN0
KTsKPiAgCQkJY2xlYXJfYml0KEJUUkZTX0RFVl9TVEFURV9XUklURUFCTEUsICZkZXZpY2UtPmRl
dl9zdGF0ZSk7Cj4gKwkJCWZzX2RldmljZXMtPnJ3X2RldmljZXMtLTsKPiAgCQl9Cj4gIAkJbGlz
dF9kZWxfaW5pdCgmZGV2aWNlLT5kZXZfbGlzdCk7Cj4gIAkJZnNfZGV2aWNlcy0+bnVtX2Rldmlj
ZXMtLTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
