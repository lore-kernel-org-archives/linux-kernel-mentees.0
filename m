Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC7C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 15:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A442F417DE;
	Tue,  1 Aug 2023 15:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A442F417DE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=chwMJPsT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxqynnJgBivE; Tue,  1 Aug 2023 15:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2EE004099D;
	Tue,  1 Aug 2023 15:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE004099D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06F21C0072;
	Tue,  1 Aug 2023 15:56:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B462C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F6181FA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F6181FA4
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=chwMJPsT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7G-TrXPmt2e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:56:49 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C09580C52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 15:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C09580C52
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686efb9ee3cso5490983b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690905408; x=1691510208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5brpN+JyRMs3vCB0iiWfT8qohlTk0adzoJMdwAMhRRw=;
 b=chwMJPsT+e2dYwtSqJJQ+OhavdHRWJV0je94Nq3zltA8xtXrzEBqnoVrgKF1O/mv3V
 6ztWfqtYgdbAU/WXYxhOAMlySpTr1NL0Imks7mO1M3tHz5ImDub+Fqa/QqqTbaIqvvip
 nf4SXqRkOw0l4EShfsMDfOOA9iLrEYFzZh0ryCQZxCQrgn2/XFU1GL8fRJxHlQmDOoFm
 kb1vJXaxaHeOScD5skcn6ricXfbSolu8prKZOh6pB8OAygKezyBggN5h5+nOiXFmmVTH
 Bj1zk8rASqRfrAzUiu6ZmIcm0BhkTECMSbzoFhnlEBUE1N5KFU1ZHjQtbvpln46XA5jM
 UO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690905408; x=1691510208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5brpN+JyRMs3vCB0iiWfT8qohlTk0adzoJMdwAMhRRw=;
 b=hShuGbQQHDJ/7MvKzaIrX9QUn+K9Vi+zLD9HOJXeid/OyDW7nT0Qe9pOEcaTgv04KS
 ci9Bn1dL4nMDC30G67az/5FYU6CVk/b/BLwX3kxQk7+g2o9+go9gd5HQXJfswPkvp4hG
 zZrRkuc59Mgvpf5M4ihBZpwdwv5im98/Y7ZwfzNzkFaldzQHQx7YtJrafOYQB7IdiJOf
 go8foLaCrOizpprTMbUtssUZD/xTczmccwr+kd3Pbdm3acxC0jF5lixn7tFfyBcUv0gn
 VDsM7Fw+GddHtW335nc6ErBAkzKIM/bo0UeAUIjzQGrmTm9FNsUxaqpLGX4o+6tb1s76
 i1sQ==
X-Gm-Message-State: ABy/qLZh/YbCi9TRchoD6JRIX8vwFYhKdIETx4QMMTWwC/mRB0LBvdjP
 o2E3ifcTBeCmrbwrNn4lFbQ=
X-Google-Smtp-Source: APBJJlGO4N2A+QNfVphxi3jNVqcxGseldJglR9AdCSYPrDVmcMjthurG8n3KtVAxoxLP6HEIaauI9w==
X-Received: by 2002:a05:6a00:150a:b0:687:4323:ec31 with SMTP id
 q10-20020a056a00150a00b006874323ec31mr6803175pfu.13.1690905408456; 
 Tue, 01 Aug 2023 08:56:48 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 t7-20020aa79387000000b00686b649cdd0sm9541673pfe.86.2023.08.01.08.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 08:56:47 -0700 (PDT)
Message-ID: <34890307-ca7a-ffa8-321d-eb5ad0db4a5a@gmail.com>
Date: Tue, 1 Aug 2023 22:56:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] samples/bpf: Fix build out of source tree
To: Stanislav Fomichev <sdf@google.com>
References: <20230730131750.16552-1-tuananhlfc@gmail.com>
 <CAKH8qBtNaEW4pEj7Y1WiLoPk2aMPoq3AuO14D=OF_NCN255awQ@mail.gmail.com>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <CAKH8qBtNaEW4pEj7Y1WiLoPk2aMPoq3AuO14D=OF_NCN255awQ@mail.gmail.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
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

CgpPbiAwMS8wOC8yMDIzIDAwOjE3LCBTdGFuaXNsYXYgRm9taWNoZXYgd3JvdGU6Cj4gT24gU3Vu
LCBKdWwgMzAsIDIwMjMgYXQgNjoxOOKAr0FNIEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBjb21taXQgZml4ZXMgYSBmZXcgY29tcGlsYXRpb24g
aXNzdWVzIHdoZW4gYnVpbGRpbmcgb3V0IG9mIHNvdXJjZQo+PiB0cmVlLiBUaGUgY29tbWFuZCB0
aGF0IEkgdXNlZCB0byBidWlsZCBzYW1wbGVzL2JwZjoKPj4KPj4gZXhwb3J0IEtCVUlMRF9PVVRQ
VVQ9L3RtcAo+PiBtYWtlIFY9MSBNPXNhbXBsZXMvYnBmCj4+Cj4+IFRoZSBjb21waWxhdGlvbiBm
YWlsZWQgc2luY2UgaXQgdHJpZWQgdG8gZmluZCB0aGUgaGVhZGVyIGZpbGVzIGluIHRoZQo+PiB3
cm9uZyBwbGFjZXMgYmV0d2VlbiBvdXRwdXQgZGlyZWN0b3J5IGFuZCBzb3VyY2UgdHJlZSBkaXJl
Y3RvcnkKPiAKPiBTdGlsbCBkb2Vzbid0IGFwcGx5IGNsZWFubHksIG1vc3QgbGlrZWx5IGR1ZSB0
byBjb21taXQgYmJhZjFmZjA2YWY0Cj4gKCJicGY6IFJlcGxhY2UgZGVwcmVjYXRlZCAtdGFyZ2V0
IHdpdGggLS10YXJnZXQ9IGZvciBDbGFuZyIpLgo+IFBsZWFzZSByZWJhc2UgYW5kIHJlcG9zdC4g
QWxzbyBhZGQgW1BBVENIIGJwZi1uZXh0IHY0XSB0YWcuCj4gCgpJIHJlYmFzZWQgdGhlIGNvbW1p
dCBmcm9tIGJwZiB0cmVlIHNvIGl0J3MgdGhlIHJlYXNvbiBmb3IgeW91ciBmYWlsZWQgCmFwcGxp
ZWQuIEhhdmUgcmViYXNlZCBmcm9tIGJwZi1uZXh0IHRyZWUgYW5kIHNlbnQgYSAiUEFUQ0ggYnBm
LW5leHQgdjQiIApwYXRjaC4KClRoYW5rIHlvdSEKCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuaCBU
dWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBmcm9tIHYx
Ogo+PiAtIFVuY29uZGl0aW9uYWxseSBhZGQgIi1JICQob2JqdHJlZSkvJChvYmopIiB0byBfdHBy
b2djX2ZsYWdzIGFuZCBkcm9wIHVubmVjZXNzYXJ5IHBhcnQKPj4gUmVmZXJlbmNlOgo+PiAtIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjdiZWM2YTktYWY1OS1kNmY5LTI2MzAtMTcy
ODA0NzlhMWY3QGdtYWlsLmNvbS8KPj4gLSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzJiYTFjMDc2LWY1YmYtNDMyZi01MGMxLTcyYzg0NTQwMzE2N0BnbWFpbC5jb20vCj4+IC0tLQo+
PiAgIHNhbXBsZXMvYnBmL01ha2VmaWxlICAgICAgICB8IDEwICsrKysrLS0tLS0KPj4gICBzYW1w
bGVzL2JwZi9NYWtlZmlsZS50YXJnZXQgfCAgOSArLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9z
YW1wbGVzL2JwZi9NYWtlZmlsZSBiL3NhbXBsZXMvYnBmL01ha2VmaWxlCj4+IGluZGV4IDYxNWYy
NGViYzQ5Yy4uY2ZjOTYwYjM3MTNhIDEwMDY0NAo+PiAtLS0gYS9zYW1wbGVzL2JwZi9NYWtlZmls
ZQo+PiArKysgYi9zYW1wbGVzL2JwZi9NYWtlZmlsZQo+PiBAQCAtMzQxLDEwICszNDEsMTAgQEAg
JChvYmopL2hibV9lZHRfa2Vybi5vOiAkKHNyYykvaGJtLmggJChzcmMpL2hibV9rZXJuLmgKPj4g
ICAjIE92ZXJyaWRlIGluY2x1ZGVzIGZvciB4ZHBfc2FtcGxlX3VzZXIubyBiZWNhdXNlICQoc3Jj
dHJlZSkvdXNyL2luY2x1ZGUgaW4KPj4gICAjIFRQUk9HU19DRkxBR1MgY2F1c2VzIGNvbmZsaWN0
cwo+PiAgIFhEUF9TQU1QTEVfQ0ZMQUdTICs9IC1XYWxsIC1PMiBcCj4+IC0gICAgICAgICAgICAg
ICAgICAgIC1JJChzcmMpLy4uLy4uL3Rvb2xzL2luY2x1ZGUgXAo+PiAtICAgICAgICAgICAgICAg
ICAgICAtSSQoc3JjKS8uLi8uLi90b29scy9pbmNsdWRlL3VhcGkgXAo+PiArICAgICAgICAgICAg
ICAgICAgICAtSSQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZSBcCj4+ICsgICAgICAgICAgICAgICAg
ICAgIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkgXAo+PiAgICAgICAgICAgICAgICAg
ICAgICAgLUkkKExJQkJQRl9JTkNMVURFKSBcCj4+IC0gICAgICAgICAgICAgICAgICAgIC1JJChz
cmMpLy4uLy4uL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZgo+PiArICAgICAgICAgICAgICAg
ICAgICAtSSQoc3JjdHJlZSkvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmCj4+Cj4+ICAgJChv
YmopLyQoWERQX1NBTVBMRSk6IFRQUk9HU19DRkxBR1MgPSAkKFhEUF9TQU1QTEVfQ0ZMQUdTKQo+
PiAgICQob2JqKS8kKFhEUF9TQU1QTEUpOiAkKHNyYykveGRwX3NhbXBsZV91c2VyLmggJChzcmMp
L3hkcF9zYW1wbGVfc2hhcmVkLmgKPj4gQEAgLTM5Myw3ICszOTMsNyBAQCAkKG9iaikveGRwX3Jv
dXRlcl9pcHY0LmJwZi5vOiAkKG9iaikveGRwX3NhbXBsZS5icGYubwo+PiAgICQob2JqKS8lLmJw
Zi5vOiAkKHNyYykvJS5icGYuYyAkKG9iaikvdm1saW51eC5oICQoc3JjKS94ZHBfc2FtcGxlLmJw
Zi5oICQoc3JjKS94ZHBfc2FtcGxlX3NoYXJlZC5oCj4+ICAgICAgICAgIEBlY2hvICIgIENMQU5H
LUJQRiAiICRACj4+ICAgICAgICAgICQoUSkkKENMQU5HKSAtZyAtTzIgLXRhcmdldCBicGYgLURf
X1RBUkdFVF9BUkNIXyQoU1JDQVJDSCkgXAo+PiAtICAgICAgICAgICAgICAgLVduby1jb21wYXJl
LWRpc3RpbmN0LXBvaW50ZXItdHlwZXMgLUkkKHNyY3RyZWUpL2luY2x1ZGUgXAo+PiArICAgICAg
ICAgICAgICAgLVduby1jb21wYXJlLWRpc3RpbmN0LXBvaW50ZXItdHlwZXMgLUkkKG9iaikgLUkk
KHNyY3RyZWUpL2luY2x1ZGUgXAo+PiAgICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS9zYW1w
bGVzL2JwZiAtSSQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZSBcCj4+ICAgICAgICAgICAgICAgICAg
LUkkKExJQkJQRl9JTkNMVURFKSAkKENMQU5HX1NZU19JTkNMVURFUykgXAo+PiAgICAgICAgICAg
ICAgICAgIC1jICQoZmlsdGVyICUuYnBmLmMsJF4pIC1vICRACj4+IEBAIC00MTIsNyArNDEyLDcg
QEAgeGRwX3JvdXRlcl9pcHY0LnNrZWwuaC1kZXBzIDo9IHhkcF9yb3V0ZXJfaXB2NC5icGYubyB4
ZHBfc2FtcGxlLmJwZi5vCj4+Cj4+ICAgTElOS0VEX0JQRl9TUkNTIDo9ICQocGF0c3Vic3QgJS5i
cGYubywlLmJwZi5jLCQoZm9yZWFjaCBza2VsLCQoTElOS0VEX1NLRUxTKSwkKCQoc2tlbCktZGVw
cykpKQo+Pgo+PiAtQlBGX1NSQ1NfTElOS0VEIDo9ICQobm90ZGlyICQod2lsZGNhcmQgJChzcmMp
LyouYnBmLmMpKQo+PiArQlBGX1NSQ1NfTElOS0VEIDo9ICQobm90ZGlyICQod2lsZGNhcmQgJChz
cmN0cmVlKS8kKHNyYykvKi5icGYuYykpCj4+ICAgQlBGX09CSlNfTElOS0VEIDo9ICQocGF0c3Vi
c3QgJS5icGYuYywkKG9iaikvJS5icGYubywgJChCUEZfU1JDU19MSU5LRUQpKQo+PiAgIEJQRl9T
S0VMU19MSU5LRUQgOj0gJChhZGRwcmVmaXggJChvYmopLywkKExJTktFRF9TS0VMUykpCj4+Cj4+
IGRpZmYgLS1naXQgYS9zYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQgYi9zYW1wbGVzL2JwZi9N
YWtlZmlsZS50YXJnZXQKPj4gaW5kZXggNzYyMWY1NWUyOTQ3Li5kMmZhYjk1OTY1MmUgMTAwNjQ0
Cj4+IC0tLSBhL3NhbXBsZXMvYnBmL01ha2VmaWxlLnRhcmdldAo+PiArKysgYi9zYW1wbGVzL2Jw
Zi9NYWtlZmlsZS50YXJnZXQKPj4gQEAgLTM4LDE0ICszOCw3IEBAIHRwcm9nLWNvYmpzICA6PSAk
KGFkZHByZWZpeCAkKG9iaikvLCQodHByb2ctY29ianMpKQo+PiAgICMgSGFuZGxlIG9wdGlvbnMg
dG8gZ2NjLiBTdXBwb3J0IGJ1aWxkaW5nIHdpdGggc2VwYXJhdGUgb3V0cHV0IGRpcmVjdG9yeQo+
Pgo+PiAgIF90cHJvZ2NfZmxhZ3MgICA9ICQoVFBST0dTX0NGTEFHUykgXAo+PiAtICAgICAgICAg
ICAgICAgICAkKFRQUk9HQ0ZMQUdTXyQoYmFzZXRhcmdldCkubykKPj4gLQo+PiAtIyAkKG9ianRy
ZWUpLyQob2JqKSBmb3IgaW5jbHVkaW5nIGdlbmVyYXRlZCBoZWFkZXJzIGZyb20gY2hlY2tpbiBz
b3VyY2UgZmlsZXMKPj4gLWlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQo+PiAtaWZkZWYgYnVpbGRp
bmdfb3V0X29mX3NyY3RyZWUKPj4gLV90cHJvZ2NfZmxhZ3MgICArPSAtSSAkKG9ianRyZWUpLyQo
b2JqKQo+PiAtZW5kaWYKPj4gLWVuZGlmCj4+ICsgICAgICAgICAgICAgICAgIC1JICQob2JqdHJl
ZSkvJChvYmopCj4+Cj4+ICAgdHByb2djX2ZsYWdzICAgID0gLVdwLC1NRCwkKGRlcGZpbGUpICQo
X3Rwcm9nY19mbGFncykKPj4KPj4gLS0KPj4gMi4zNC4xCj4+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
