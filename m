Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B23C11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 02:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9474161D90
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 02:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9474161D90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6893F83AB2;
	Wed, 30 Jun 2021 02:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tu6wKef1rnX9; Wed, 30 Jun 2021 02:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F204083AAF;
	Wed, 30 Jun 2021 02:36:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0B28C0010;
	Wed, 30 Jun 2021 02:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8814BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 02:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F3C405F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 02:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atRr0D1KFTBp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 02:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99F59405FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 02:36:12 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t9so738528pgn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vwd7IsRrp/T/LYxrS9jpNnIbBfNUxIhyCA5fuEJb/hs=;
 b=p7cd/RjTnmf/k/gz3pbr2Qx3kJvJWlO2L/epw3XeLW46rn3mrhP3adzzQ7cXIxAN1E
 knhHinhhB2yfgIz9QxDdgueiI8Ry1hL6uEZ8fJRN8AWplQ4wrIgWdBbo8DM+WAnKf7f6
 x+SOLsKzsEtX8nrAhH21dsqaw49vwi+Uu1GbwAM6xUULVw3JleGovm0sgbJA1yCs4w73
 UUuylwrGgFnMoYOxqs5QRVaOLiBs1MgwMSB1NeK65bqyjlXTZYN3OaWxg4s9LjQoQx5N
 wnrxUA0sxGRfme4ui0IxrRMY+8Jc0F56sC2zELbR0zXS6IPIWDDbyLS9Q6VZwbdlV6Em
 Ij1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vwd7IsRrp/T/LYxrS9jpNnIbBfNUxIhyCA5fuEJb/hs=;
 b=mxLLMKz09XsgM90oS44ZGm+1xrjlGN++hFx5gko3e/82JsiyuoCfCQ2K9HL4EbQP5r
 5L2bLKYEWBOsgB7WWTGc7E7q+0h9ndYK0GlHNQAw8LcsRiM2vdX+hg99RguNQ/a208CU
 5rODV2oTrt6Kz+HlXWpc1J6HQNAebtIRMFTuwauwQsbVQH4pnJz3cvpRzC40IBRrjV5v
 kEN265bmkB9EL/ExGt4TjR5dTkkWScyZ5DYzgPrdJ38xwwOKcrUt9dVnPUvmkAXYRmNL
 zSEzo/YPwWytCb8lYIBungPeJihQdXvnUNkxMLGVeLLDJhK3AXtUfGr+6aniGa4jLLsH
 /lzQ==
X-Gm-Message-State: AOAM531IOJ3WVyI9nesLx07sAamSM0D745RVv+sJEsbe/ThSiL+PeeTO
 a/T8UvAeejIVe6PDMBkfdz0cGuHmcJkk7dq8O10=
X-Google-Smtp-Source: ABdhPJxDIwxkkCOVfJmmddgVrHXe+xzsKT3YGKNLw3ncuIrm2fIrReITTBgsr7q1rePb71VtoChSGg==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr32026193pgk.2.1625020571681; 
 Tue, 29 Jun 2021 19:36:11 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id z27sm19890437pfg.91.2021.06.29.19.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 19:36:11 -0700 (PDT)
Subject: Re: [PATCH 2/3] hfs: fix high memory mapping in hfs_bnode_read
To: Viacheslav Dubeyko <slava@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-3-desmondcheongzx@gmail.com>
 <4E2B2BE9-3C0F-4D99-A099-601A780E0CED@dubeyko.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <bd0e5597-7fa6-dd80-9f3d-f48c3806d5fb@gmail.com>
Date: Wed, 30 Jun 2021 10:36:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4E2B2BE9-3C0F-4D99-A099-601A780E0CED@dubeyko.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMzAvNi8yMSAzOjMxIGFtLCBWaWFjaGVzbGF2IER1YmV5a28gd3JvdGU6Cj4gCj4gCj4+IE9u
IEp1biAyOSwgMjAyMSwgYXQgNzo0OCBBTSwgRGVzbW9uZCBDaGVvbmcgWmhpIFhpIDxkZXNtb25k
Y2hlb25nenhAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gUGFnZXMgdGhhdCB3ZSByZWFkIGluIGhm
c19ibm9kZV9yZWFkIG5lZWQgdG8gYmUga21hcHBlZCBpbnRvIGtlcm5lbAo+PiBhZGRyZXNzIHNw
YWNlLiBIb3dldmVyLCBjdXJyZW50bHkgb25seSB0aGUgMHRoIHBhZ2UgaXMga21hcHBlZC4gSWYg
dGhlCj4+IGdpdmVuIG9mZnNldCArIGxlbmd0aCBleGNlZWRzIHRoaXMgMHRoIHBhZ2UsIHRoZW4g
d2UgaGF2ZSBhbiBpbnZhbGlkCj4+IG1lbW9yeSBhY2Nlc3MuCj4+Cj4+IFRvIGZpeCB0aGlzLCB3
ZSB1c2UgdGhlIHNhbWUgbG9naWMgdXNlZCAgaW4gaGZzcGx1cycgdmVyc2lvbiBvZgo+PiBoZnNf
Ym5vZGVfcmVhZCB0byBrbWFwIGVhY2ggcGFnZSBvZiByZWxldmFudCBkYXRhIHRoYXQgd2UgY29w
eS4KPj4KPj4gQW4gZXhhbXBsZSBvZiBpbnZhbGlkIG1lbW9yeSBhY2Nlc3Mgb2NjdXJyaW5nIHdp
dGhvdXQgdGhpcyBmaXggY2FuIGJlCj4+IHNlZW4gaW4gdGhlIGZvbGxvd2luZyBjcmFzaCByZXBv
cnQ6Cj4+Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+PiBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBtZW1j
cHkgaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjE5MSBbaW5saW5lXQo+PiBCVUc6IEtB
U0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBoZnNfYm5vZGVfcmVhZCsweGM0LzB4ZTAgZnMvaGZzL2Ju
b2RlLmM6MjYKPj4gUmVhZCBvZiBzaXplIDIgYXQgYWRkciBmZmZmODg4MTI1ZmRjZmZlIGJ5IHRh
c2sgc3l6LWV4ZWN1dG9yNS80NjM0Cj4+Cj4+IENQVTogMCBQSUQ6IDQ2MzQgQ29tbTogc3l6LWV4
ZWN1dG9yNSBOb3QgdGFpbnRlZCA1LjEzLjAtc3l6a2FsbGVyICMwCj4+IEhhcmR3YXJlIG5hbWU6
IEdvb2dsZSBHb29nbGUgQ29tcHV0ZSBFbmdpbmUvR29vZ2xlIENvbXB1dGUgRW5naW5lLCBCSU9T
IEdvb2dsZSAwMS8wMS8yMDExCj4+IENhbGwgVHJhY2U6Cj4+IF9fZHVtcF9zdGFjayBsaWIvZHVt
cF9zdGFjay5jOjc5IFtpbmxpbmVdCj4+IGR1bXBfc3RhY2srMHgxOTUvMHgxZjggbGliL2R1bXBf
c3RhY2suYzoxMjAKPj4gcHJpbnRfYWRkcmVzc19kZXNjcmlwdGlvbi5jb25zdHByb3AuMCsweDFk
LzB4MTEwIG1tL2thc2FuL3JlcG9ydC5jOjIzMwo+PiBfX2thc2FuX3JlcG9ydCBtbS9rYXNhbi9y
ZXBvcnQuYzo0MTkgW2lubGluZV0KPj4ga2FzYW5fcmVwb3J0LmNvbGQrMHg3Yi8weGQ0IG1tL2th
c2FuL3JlcG9ydC5jOjQzNgo+PiBjaGVja19yZWdpb25faW5saW5lIG1tL2thc2FuL2dlbmVyaWMu
YzoxODAgW2lubGluZV0KPj4ga2FzYW5fY2hlY2tfcmFuZ2UrMHgxNTQvMHgxYjAgbW0va2FzYW4v
Z2VuZXJpYy5jOjE4Ngo+PiBtZW1jcHkrMHgyNC8weDYwIG1tL2thc2FuL3NoYWRvdy5jOjY1Cj4+
IG1lbWNweSBpbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6MTkxIFtpbmxpbmVdCj4+IGhm
c19ibm9kZV9yZWFkKzB4YzQvMHhlMCBmcy9oZnMvYm5vZGUuYzoyNgo+PiBoZnNfYm5vZGVfcmVh
ZF91MTYgZnMvaGZzL2Jub2RlLmM6MzQgW2lubGluZV0KPj4gaGZzX2Jub2RlX2ZpbmQrMHg4ODAv
MHhjYzAgZnMvaGZzL2Jub2RlLmM6MzY1Cj4+IGhmc19icmVjX2ZpbmQrMHgyZDgvMHg1NDAgZnMv
aGZzL2JmaW5kLmM6MTI2Cj4+IGhmc19icmVjX3JlYWQrMHgyNy8weDEyMCBmcy9oZnMvYmZpbmQu
YzoxNjUKPj4gaGZzX2NhdF9maW5kX2JyZWMrMHgxOWEvMHgzYjAgZnMvaGZzL2NhdGFsb2cuYzox
OTQKPj4gaGZzX2ZpbGxfc3VwZXIrMHhjMTMvMHgxNDYwIGZzL2hmcy9zdXBlci5jOjQxOQo+PiBt
b3VudF9iZGV2KzB4MzMxLzB4M2YwIGZzL3N1cGVyLmM6MTM2OAo+PiBoZnNfbW91bnQrMHgzNS8w
eDQwIGZzL2hmcy9zdXBlci5jOjQ1Nwo+PiBsZWdhY3lfZ2V0X3RyZWUrMHgxMGMvMHgyMjAgZnMv
ZnNfY29udGV4dC5jOjU5Mgo+PiB2ZnNfZ2V0X3RyZWUrMHg5My8weDMwMCBmcy9zdXBlci5jOjE0
OTgKPj4gZG9fbmV3X21vdW50IGZzL25hbWVzcGFjZS5jOjI5MDUgW2lubGluZV0KPj4gcGF0aF9t
b3VudCsweDEzZjUvMHgyMGUwIGZzL25hbWVzcGFjZS5jOjMyMzUKPj4gZG9fbW91bnQgZnMvbmFt
ZXNwYWNlLmM6MzI0OCBbaW5saW5lXQo+PiBfX2RvX3N5c19tb3VudCBmcy9uYW1lc3BhY2UuYzoz
NDU2IFtpbmxpbmVdCj4+IF9fc2Vfc3lzX21vdW50IGZzL25hbWVzcGFjZS5jOjM0MzMgW2lubGlu
ZV0KPj4gX194NjRfc3lzX21vdW50KzB4MmI4LzB4MzQwIGZzL25hbWVzcGFjZS5jOjM0MzMKPj4g
ZG9fc3lzY2FsbF82NCsweDM3LzB4YzAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6NDcKPj4gZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhZQo+PiBSSVA6IDAwMzM6MHg0NWU2
M2EKPj4gQ29kZTogNDggYzcgYzIgYmMgZmYgZmYgZmYgZjcgZDggNjQgODkgMDIgYjggZmYgZmYg
ZmYgZmYgZWIgZDIgZTggODggMDQgMDAgMDAgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgNDkgODkg
Y2EgYjggYTUgMDAgMDAgMDAgMGYgMDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCBj
NyBjMSBiYyBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OAo+PiBSU1A6IDAwMmI6MDAwMDdmOTQw
NGQ0MTBkOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMGE1Cj4+IFJB
WDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDAwMDAwMjAwMDAyNDggUkNYOiAwMDAwMDAwMDAw
NDVlNjNhCj4+IFJEWDogMDAwMDAwMDAyMDAwMDAwMCBSU0k6IDAwMDAwMDAwMjAwMDAxMDAgUkRJ
OiAwMDAwN2Y5NDA0ZDQxMTIwCj4+IFJCUDogMDAwMDdmOTQwNGQ0MTEyMCBSMDg6IDAwMDAwMDAw
MjAwMDAyYzAgUjA5OiAwMDAwMDAwMDIwMDAwMDAwCj4+IFIxMDogMDAwMDAwMDAwMDAwMDAwMCBS
MTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAzCj4+IFIxMzogMDAwMDAw
MDAwMDAwMDAwMyBSMTQ6IDAwMDAwMDAwMDA0YWQ1ZDggUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4+
Cj4+IFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIHBhZ2U6Cj4+IHBhZ2U6MDAwMDAw
MDBkYWRiY2YzZSByZWZjb3VudDowIG1hcGNvdW50OjAgbWFwcGluZzowMDAwMDAwMDAwMDAwMDAw
IGluZGV4OjB4MSBwZm46MHgxMjVmZGMKPj4gZmxhZ3M6IDB4MmZmZmMwMDAwMDAwMDAwKG5vZGU9
MHx6b25lPTJ8bGFzdGNwdXBpZD0weDNmZmYpCj4+IHJhdzogMDJmZmZjMDAwMDAwMDAwMCBmZmZm
ZWEwMDA0OTdmNzQ4IGZmZmZlYTAwMDQ5N2Y2YzggMDAwMDAwMDAwMDAwMDAwMAo+PiByYXc6IDAw
MDAwMDAwMDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMGZmZmZmZmZmIDAwMDAwMDAw
MDAwMDAwMDAKPj4gcGFnZSBkdW1wZWQgYmVjYXVzZToga2FzYW46IGJhZCBhY2Nlc3MgZGV0ZWN0
ZWQKPj4KPj4gTWVtb3J5IHN0YXRlIGFyb3VuZCB0aGUgYnVnZ3kgYWRkcmVzczoKPj4gZmZmZjg4
ODEyNWZkY2U4MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYKPj4gZmZmZjg4ODEyNWZkY2YwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYKPj4+IGZmZmY4ODgxMjVmZGNmODA6IGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4+IGZmZmY4ODgxMjVmZGQw
MDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+IGZm
ZmY4ODgxMjVmZGQwODA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmCj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEZXNtb25kIENoZW9uZyBa
aGkgWGkgPGRlc21vbmRjaGVvbmd6eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiBmcy9oZnMvYm5vZGUu
YyB8IDE4ICsrKysrKysrKysrKysrLS0tLQo+PiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2hmcy9ibm9kZS5jIGIv
ZnMvaGZzL2Jub2RlLmMKPj4gaW5kZXggYjYzYTRkZjczMjdiLi45MzZjZmE3NjMyMjQgMTAwNjQ0
Cj4+IC0tLSBhL2ZzL2hmcy9ibm9kZS5jCj4+ICsrKyBiL2ZzL2hmcy9ibm9kZS5jCj4+IEBAIC0x
OCwxMyArMTgsMjMgQEAKPj4gdm9pZCBoZnNfYm5vZGVfcmVhZChzdHJ1Y3QgaGZzX2Jub2RlICpu
b2RlLCB2b2lkICpidWYsCj4+IAkJaW50IG9mZiwgaW50IGxlbikKPj4gewo+PiAtCXN0cnVjdCBw
YWdlICpwYWdlOwo+PiArCXN0cnVjdCBwYWdlICoqcGFnZXA7Cj4+ICsJaW50IGw7Cj4+Cj4+IAlv
ZmYgKz0gbm9kZS0+cGFnZV9vZmZzZXQ7Cj4+IC0JcGFnZSA9IG5vZGUtPnBhZ2VbMF07Cj4+ICsJ
cGFnZXAgPSBub2RlLT5wYWdlICsgKG9mZiA+PiBQQUdFX1NISUZUKTsKPiAKPiBJIHdvdWxkIGxp
a2UgdG8gaGF2ZSBhIGNoZWNrIGhlcmUgdGhhdCB3ZSBhcmUgbm90IG91dCBvZiB0aGUgcGFnZSBh
cnJheS4gQ291bGQgeW91IGFkZCB0aGlzIGNoZWNrPwo+IAo+IEFsc28sIG1heWJlLCBub2RlLT5w
YWdlW2luZGV4XSBjb3VsZCBsb29rIG11Y2ggc2FmZXIgaGVyZS4gV2hhdCBkbyB5b3UgdGhpbms/
Cj4gCgpIaSBTbGF2YSwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkNoZWNraW5nIHRoYXQgd2Ug
ZG9uJ3QgZXhjZWVkIHRoZSBwYWdlIGFycmF5IHNvdW5kcyBnb29kLiBBbHNvIGFncmVlIAp0aGF0
IG5vZGUtPnBhZ2VbaW5kZXhdIGxvb2tzIG1vcmUgcmVhZGFibGUuCgo+PiArCW9mZiAmPSB+UEFH
RV9NQVNLOwo+Pgo+PiAtCW1lbWNweShidWYsIGttYXAocGFnZSkgKyBvZmYsIGxlbik7Cj4+IC0J
a3VubWFwKHBhZ2UpOwo+PiArCWwgPSBtaW5fdChpbnQsIGxlbiwgUEFHRV9TSVpFIC0gb2ZmKTsK
PiAKPiBNYXliZSwgaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIG1vcmUgaW5mb3JtYXRpdmUgbmFtZSBv
ZiB0aGUgdmFyaWFibGUgaW5zdGVhZCBvZiDigJxs4oCdPwo+IAo+PiArCW1lbWNweShidWYsIGtt
YXAoKnBhZ2VwKSArIG9mZiwgbCk7Cj4gCj4gSSBzdXBwb3NlIHRoYXQgaXQgY291bGQgYmUgZ29v
ZCB0byBoYXZlIGEgY2hlY2sgdGhhdCB3ZSBkbyBub3Qgb3ZlcmZsb3cgdGhlIGJ1ZmZlci4gSG93
IGRvIHlvdSBmZWVsIGFib3V0IGl0Pwo+IAoKVGhlIGNvbXB1dGF0aW9uIG9mIGBsID0gbWluX3Qo
aW50LCBsZW4sIFBBR0VfU0laRSAtIG9mZik7YCBlbnN1cmVzIHRoYXQgCndlIGRvbid0IG92ZXJm
bG93IHRoZSBidWZmZXIgYmVjYXVzZSB0aGUgbnVtYmVyIG9mIGJ5dGVzIHJlYWQgd29uJ3QgCmV4
Y2VlZCB0aGUgZ2l2ZW4gbGVuLiBCdXQgSSB0aGluayB5b3UncmUgcmlnaHQgdGhhdCB0aGlzIGNh
biBiZSBtYWRlIAptb3JlIGV4cGxpY2l0LCBhbG9uZ3NpZGUgZ2l2aW5nICJsIiBhIG1vcmUgaW5m
b3JtYXRpdmUgbmFtZS4KCj4+ICsJa3VubWFwKCpwYWdlcCk7Cj4gCj4gV2hhdOKAmXMgYWJvdXQg
a21hcF9hdG9taWMva3VubWFwX2F0b21pYyBpbiB0aGlzIGZ1bmN0aW9uPwo+IAo+IFRoYW5rcywK
PiBTbGF2YS4KPiAKCmttYXBfYXRvbWljL2t1bm1hcF9hdG9taWMgc291bmRzIGdvb2QgdG8gbWUu
IEknbGwgZm9sbG93dXAgd2l0aCBhIHYyIApzZXJpZXMuIFRoYW5rcyBhZ2FpbiEKCkJlc3Qgd2lz
aGVzLApEZXNtb25kCgo+PiArCj4+ICsJd2hpbGUgKChsZW4gLT0gbCkgIT0gMCkgewo+PiArCQli
dWYgKz0gbDsKPj4gKwkJbCA9IG1pbl90KGludCwgbGVuLCBQQUdFX1NJWkUpOwo+PiArCQltZW1j
cHkoYnVmLCBrbWFwKCorK3BhZ2VwKSwgbCk7Cj4+ICsJCWt1bm1hcCgqcGFnZXApOwo+PiArCX0K
Pj4gfQo+Pgo+PiB1MTYgaGZzX2Jub2RlX3JlYWRfdTE2KHN0cnVjdCBoZnNfYm5vZGUgKm5vZGUs
IGludCBvZmYpCj4+IC0tIAo+PiAyLjI1LjEKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlz
dApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1t
ZW50ZWVzCg==
