Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3522C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Jul 2023 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C75441A54;
	Fri, 28 Jul 2023 16:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C75441A54
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AvMPpLJi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lirkneuWmmB; Fri, 28 Jul 2023 16:30:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 566A640C1E;
	Fri, 28 Jul 2023 16:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 566A640C1E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33E17C0071;
	Fri, 28 Jul 2023 16:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1948EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E703E42155
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 16:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E703E42155
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=AvMPpLJi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uccvDlGpQ3n8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 16:30:17 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D12841F52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 16:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D12841F52
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a5ac84718dso1857082b6e.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690561816; x=1691166616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERdUxHgCtf4PRByjyNFY0jw8J1N+cRKtHihzJzi9tpg=;
 b=AvMPpLJiuuPjWrVXfDiUdn4OY9iS6NOlRJtb8rvI4D3OXAQ4Mh33UiiLA80eH5Pq/A
 F5O9JAbb3L7uBtsbVWbL1Zr+CIL3KS2i9znF9XNqaZvcJPhw/K7iaFkhPsAKcH3IFHBo
 xGBScn2T7QBpDrKCbhoPVdVwRPHOhZJO1raURSW4lbTLbLeUai9AfXC9tWHtp06oszsQ
 AsBY3ElKqNn3bR6qh415/s+wnZ63QY2WHrEGp9vwfK2TuSJIZf8/EZnH90FUe34wiCHp
 OKVU98Q+pD5nawHYXHo2lcJNQegsDACQ9FnyLyeji+2wXql/3mG7FB9eOmYGttej/YSk
 Te3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690561816; x=1691166616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ERdUxHgCtf4PRByjyNFY0jw8J1N+cRKtHihzJzi9tpg=;
 b=TMafjRJL7L1YXQwOYUsZ9KbjoHwD6TNTuK90TmVtHhV/Hth8sUqy9OJ67Fn9+h68uq
 XBGNUyiBZWPQ9dUKoWdW3yyZbJvUYiRpDKvHWjGabe2TKvqvqVxHX8bDeiQprIGUNIWW
 2gpvsQNAhXAaaR3tyB65H5ojwVOutTMQ0jYobrEHaOVnZbcobfqIZO0QU5UVMP/YSE/u
 l/6xZ8D60WjwOeXMiuTiqXqTmwOqPjEZmrVI6K03yhfsLPc+i7ZCoe0JG0SeSL1M24GP
 5cSxteD1l80cQKuEfHqbLZynjNcNY3trFfwCm2g0QQ/dtLq+p5Qm7AahZjL32Gade/eN
 /vow==
X-Gm-Message-State: ABy/qLYiUys1TQDRR6SjLSkTmP4oXJB8wkdhHHySxlMRY3qAuDfKRb6y
 oGu3S9i+nTEvyn3f/WT5gt7+g4Tf/5frpMfOGCxpJA==
X-Google-Smtp-Source: APBJJlGWaEvPknSFylhXCPdiFY+yqrc0KovyuYagF+Qnrzppivy4Gy9lX+hlPJtfjPuJBYMDlVrbg2Kjut3WDblUy3Y=
X-Received: by 2002:a05:6808:1689:b0:3a1:e17a:b3fb with SMTP id
 bb9-20020a056808168900b003a1e17ab3fbmr4050638oib.1.1690561816550; Fri, 28 Jul
 2023 09:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <2ba1c076-f5bf-432f-50c1-72c845403167@gmail.com>
In-Reply-To: <2ba1c076-f5bf-432f-50c1-72c845403167@gmail.com>
Date: Fri, 28 Jul 2023 09:30:04 -0700
Message-ID: <CAKH8qBtJ-Nb--BqH+J6K4S++J7J-8uHTPewS3BrVA86GBry=sQ@mail.gmail.com>
Subject: Re: [PATCH v2] samples/bpf: Fix build out of source tree
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel <daniel@iogearbox.net>, "martin.lau" <martin.lau@linux.dev>,
 ast <ast@kernel.org>, andrii <andrii@kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNTo0M+KAr1BNIEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhs
ZmNAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoaXMgY29tbWl0IGZpeGVzIGEgZmV3IGNvbXBpbGF0
aW9uIGlzc3VlcyB3aGVuIGJ1aWxkaW5nIG91dCBvZiBzb3VyY2UKPiB0cmVlLiBUaGUgY29tbWFu
ZCB0aGF0IEkgdXNlZCB0byBidWlsZCBzYW1wbGVzL2JwZjoKPgo+IGV4cG9ydCBLQlVJTERfT1VU
UFVUPS90bXAKPiBtYWtlIFY9MSBNPXNhbXBsZXMvYnBmCj4KPiBUaGUgY29tcGlsYXRpb24gZmFp
bGVkIHNpbmNlIGl0IHRyaWVkIHRvIGZpbmQgdGhlIGhlYWRlciBmaWxlcyBpbiB0aGUKPiB3cm9u
ZyBwbGFjZXMgYmV0d2VlbiBvdXRwdXQgZGlyZWN0b3J5IGFuZCBzb3VyY2UgdHJlZSBkaXJlY3Rv
cnkKCkkgd2FzIGdvaW5nIHRvIHRlc3QgaXQgbG9jYWxseSwgYnV0IEkgY2FuJ3QgYXBwbHkgaXQu
IFBhdGNod29yayBhbHNvCmNvbXBsYWlucyBhYm91dCB0aGUgc2FtZSBpc3N1ZToKICBzdGRlcnI6
ICdlcnJvcjogY29ycnVwdCBwYXRjaCBhdCBsaW5lIDMzCgpBcmUgeW91IGNvcHktcGFzdGluZyBp
dCB0byBnbWFpbCBtYXliZT8gKG9yIG1hbnVhbGx5IGVkaXRlZCBpdCBhZnRlcgpnaXQgZm9ybWF0
LXBhdGNoPykKTWF5YmUgcmViYXNlLCBhbmQgcmVzZW5kIHByb3Blcmx5IHdpdGggZ2l0IHNlbmQt
ZW1haWw/Cgo+IFNpZ25lZC1vZmYtYnk6IEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwu
Y29tPgo+IC0tLQo+IENoYW5nZXMgZnJvbSB2MToKPiAtIFVuY29uZGl0aW9uYWxseSBhZGQgIi1J
ICQob2JqdHJlZSkvJChvYmopIiB0byBfdHByb2djX2ZsYWdzIGFuZCBkcm9wCj4gICB1bm5lY2Vz
c2FyeSBwYXJ0Cj4gUmVmZXJlbmNlOgo+IC0gdjE6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzY3YmVjNmE5LWFmNTktZDZmOS0yNjMwLTE3MjgwNDc5YTFmN0BnbWFpbC5jb20vCj4gLS0t
Cj4gIHNhbXBsZXMvYnBmL01ha2VmaWxlICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgc2FtcGxl
cy9icGYvTWFrZWZpbGUudGFyZ2V0IHwgIDkgKy0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zYW1wbGVz
L2JwZi9NYWtlZmlsZSBiL3NhbXBsZXMvYnBmL01ha2VmaWxlCj4gaW5kZXggNjE1ZjI0ZWJjNDlj
Li5jZmM5NjBiMzcxM2EgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy9icGYvTWFrZWZpbGUKPiArKysg
Yi9zYW1wbGVzL2JwZi9NYWtlZmlsZQo+IEBAIC0zNDEsMTAgKzM0MSwxMCBAQCAkKG9iaikvaGJt
X2VkdF9rZXJuLm86ICQoc3JjKS9oYm0uaCAkKHNyYykvaGJtX2tlcm4uaAo+ICAjIE92ZXJyaWRl
IGluY2x1ZGVzIGZvciB4ZHBfc2FtcGxlX3VzZXIubyBiZWNhdXNlICQoc3JjdHJlZSkvdXNyL2lu
Y2x1ZGUgaW4KPiAgIyBUUFJPR1NfQ0ZMQUdTIGNhdXNlcyBjb25mbGljdHMKPiAgWERQX1NBTVBM
RV9DRkxBR1MgKz0gLVdhbGwgLU8yIFwKPiAtICAgICAgICAgICAgICAgICAgICAtSSQoc3JjKS8u
Li8uLi90b29scy9pbmNsdWRlIFwKPiAtICAgICAgICAgICAgICAgICAgICAtSSQoc3JjKS8uLi8u
Li90b29scy9pbmNsdWRlL3VhcGkgXAo+ICsgICAgICAgICAgICAgICAgICAgIC1JJChzcmN0cmVl
KS90b29scy9pbmNsdWRlIFwKPiArICAgICAgICAgICAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9v
bHMvaW5jbHVkZS91YXBpIFwKPiAgICAgICAgICAgICAgICAgICAgICAtSSQoTElCQlBGX0lOQ0xV
REUpIFwKPiAtICAgICAgICAgICAgICAgICAgICAtSSQoc3JjKS8uLi8uLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYKPiArICAgICAgICAgICAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmCj4KPiAgJChvYmopLyQoWERQX1NBTVBMRSk6IFRQUk9HU19D
RkxBR1MgPSAkKFhEUF9TQU1QTEVfQ0ZMQUdTKQo+ICAkKG9iaikvJChYRFBfU0FNUExFKTogJChz
cmMpL3hkcF9zYW1wbGVfdXNlci5oICQoc3JjKS94ZHBfc2FtcGxlX3NoYXJlZC5oCj4gQEAgLTM5
Myw3ICszOTMsNyBAQCAkKG9iaikveGRwX3JvdXRlcl9pcHY0LmJwZi5vOiAkKG9iaikveGRwX3Nh
bXBsZS5icGYubwo+ICAkKG9iaikvJS5icGYubzogJChzcmMpLyUuYnBmLmMgJChvYmopL3ZtbGlu
dXguaCAkKHNyYykveGRwX3NhbXBsZS5icGYuaAo+ICQoc3JjKS94ZHBfc2FtcGxlX3NoYXJlZC5o
Cj4gICAgICAgICBAZWNobyAiICBDTEFORy1CUEYgIiAkQAo+ICAgICAgICAgJChRKSQoQ0xBTkcp
IC1nIC1PMiAtdGFyZ2V0IGJwZiAtRF9fVEFSR0VUX0FSQ0hfJChTUkNBUkNIKSBcCj4gLSAgICAg
ICAgICAgICAgIC1Xbm8tY29tcGFyZS1kaXN0aW5jdC1wb2ludGVyLXR5cGVzIC1JJChzcmN0cmVl
KS9pbmNsdWRlIFwKPiArICAgICAgICAgICAgICAgLVduby1jb21wYXJlLWRpc3RpbmN0LXBvaW50
ZXItdHlwZXMgLUkkKG9iaikgLUkkKHNyY3RyZWUpL2luY2x1ZGUgXAo+ICAgICAgICAgICAgICAg
ICAtSSQoc3JjdHJlZSkvc2FtcGxlcy9icGYgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUgXAo+
ICAgICAgICAgICAgICAgICAtSSQoTElCQlBGX0lOQ0xVREUpICQoQ0xBTkdfU1lTX0lOQ0xVREVT
KSBcCj4gICAgICAgICAgICAgICAgIC1jICQoZmlsdGVyICUuYnBmLmMsJF4pIC1vICRACj4gQEAg
LTQxMiw3ICs0MTIsNyBAQCB4ZHBfcm91dGVyX2lwdjQuc2tlbC5oLWRlcHMgOj0geGRwX3JvdXRl
cl9pcHY0LmJwZi5vCj4geGRwX3NhbXBsZS5icGYubwo+Cj4gIExJTktFRF9CUEZfU1JDUyA6PSAk
KHBhdHN1YnN0ICUuYnBmLm8sJS5icGYuYywkKGZvcmVhY2gKPiBza2VsLCQoTElOS0VEX1NLRUxT
KSwkKCQoc2tlbCktZGVwcykpKQo+Cj4gLUJQRl9TUkNTX0xJTktFRCA6PSAkKG5vdGRpciAkKHdp
bGRjYXJkICQoc3JjKS8qLmJwZi5jKSkKPiArQlBGX1NSQ1NfTElOS0VEIDo9ICQobm90ZGlyICQo
d2lsZGNhcmQgJChzcmN0cmVlKS8kKHNyYykvKi5icGYuYykpCj4gIEJQRl9PQkpTX0xJTktFRCA6
PSAkKHBhdHN1YnN0ICUuYnBmLmMsJChvYmopLyUuYnBmLm8sICQoQlBGX1NSQ1NfTElOS0VEKSkK
PiAgQlBGX1NLRUxTX0xJTktFRCA6PSAkKGFkZHByZWZpeCAkKG9iaikvLCQoTElOS0VEX1NLRUxT
KSkKPgo+IGRpZmYgLS1naXQgYS9zYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQgYi9zYW1wbGVz
L2JwZi9NYWtlZmlsZS50YXJnZXQKPiBpbmRleCA3NjIxZjU1ZTI5NDcuLmQyZmFiOTU5NjUyZSAx
MDA2NDQKPiAtLS0gYS9zYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQKPiArKysgYi9zYW1wbGVz
L2JwZi9NYWtlZmlsZS50YXJnZXQKPiBAQCAtMzgsMTQgKzM4LDcgQEAgdHByb2ctY29ianMgIDo9
ICQoYWRkcHJlZml4ICQob2JqKS8sJCh0cHJvZy1jb2JqcykpCj4gICMgSGFuZGxlIG9wdGlvbnMg
dG8gZ2NjLiBTdXBwb3J0IGJ1aWxkaW5nIHdpdGggc2VwYXJhdGUgb3V0cHV0IGRpcmVjdG9yeQo+
Cj4gIF90cHJvZ2NfZmxhZ3MgICA9ICQoVFBST0dTX0NGTEFHUykgXAo+IC0gICAgICAgICAgICAg
ICAgICQoVFBST0dDRkxBR1NfJChiYXNldGFyZ2V0KS5vKQo+IC0KPiAtIyAkKG9ianRyZWUpLyQo
b2JqKSBmb3IgaW5jbHVkaW5nIGdlbmVyYXRlZCBoZWFkZXJzIGZyb20gY2hlY2tpbiBzb3VyY2UK
PiBmaWxlcwo+IC1pZmVxICgkKEtCVUlMRF9FWFRNT0QpLCkKPiAtaWZkZWYgYnVpbGRpbmdfb3V0
X29mX3NyY3RyZWUKPiAtX3Rwcm9nY19mbGFncyAgICs9IC1JICQob2JqdHJlZSkvJChvYmopCj4g
LWVuZGlmCj4gLWVuZGlmCj4gKyAgICAgICAgICAgICAgICAgLUkgJChvYmp0cmVlKS8kKG9iaikK
Pgo+ICB0cHJvZ2NfZmxhZ3MgICAgPSAtV3AsLU1ELCQoZGVwZmlsZSkgJChfdHByb2djX2ZsYWdz
KQo+Cj4gLS0KPiAyLjM0LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
