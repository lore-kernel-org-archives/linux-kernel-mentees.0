Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2302C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 17:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9C640136;
	Mon, 31 Jul 2023 17:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9C640136
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=p5LLEbIQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W041-RMSM1Rw; Mon, 31 Jul 2023 17:17:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2B11A40577;
	Mon, 31 Jul 2023 17:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B11A40577
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2181C0071;
	Mon, 31 Jul 2023 17:17:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D90FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 17:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF8281EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 17:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF8281EDB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=p5LLEbIQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmSytOVv21WR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 17:17:23 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590AC81ED5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 17:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590AC81ED5
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-55ae2075990so2969623a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690823842; x=1691428642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YySrW/mX3IXPNrvq1xkd6fhbbO6Lnq+twOHWvtcNUYc=;
 b=p5LLEbIQFJTtr/NRAExSCkkzmun+3iHr4QHpWSL/GCXT8ocmDLVb1bn2y0iEDazCz9
 CAPe3Hl+GEqpzpNquGZgTMMFpx4NQgbYlpVQST0/u4V2xohbOfRNT/rT4hAj7Q/v+6HC
 x/51hMbN5kgVqP5A0jSImllP5Rwexe9/7rlq9v6BEqPEu54dS76wrd+Wp2bcwNOlY93+
 eHzeE5cXlJuLI0H07Xd5wVjXALLga2POK7oF9MNFG9atGb4npEP77nquSZPhRto2HlP9
 ehJrn8DMhLZJy9XHoYwULOY5FadwULWmNPLoLspjJZPaHF8uZ5dJVcupmelvPhrOBr3o
 X5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690823843; x=1691428643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YySrW/mX3IXPNrvq1xkd6fhbbO6Lnq+twOHWvtcNUYc=;
 b=XfGqi9hvwpH9bMxHR4akZF2pdYEIYH2IQiaR89rVfbWwuDjfXXlvG+W2EtXDZ2heXj
 MpJwiIF3UIY1kIBNhri1uhCjseHlkgoE95ekDwQJLqV2ZkpjkIw6geFYeXSXgTs2lj2P
 q8ezvO5g7fre9aZUdqIUbrd/X+WHIiLWy3HUpdExnPR55U4rzgANmVWSeD+2UAx6Q6RZ
 pcIMkCLb1WdyF6zrm47m1pH8Cv74CiaTC9ttF9qDssg2x76vS2FrIWzT2VSU8KIzqx2e
 hTX6M4DUAj+bAYQq3ZkqK2R3GDj2jP22IBJT1m4PMwPhn2CCAKy6dnsz04shedcocb2H
 0Dcg==
X-Gm-Message-State: ABy/qLaFx8lKej8LzDmgQLNGPjyMr3FmlB4/CWFWEn5F0Dzx2k0ID6xu
 OHVGxfZqpPouyjjrLIWdmNVSsUwbCJop+d15AtkA2Q==
X-Google-Smtp-Source: APBJJlHfyeIugZo1uvIqNr9v6g8QvSHtF4QRH7BpKAi2Wd3EgDQn20WeLAYr4ne7jQmvXgNEOK7zVi3jFCnEXvUkgtI=
X-Received: by 2002:a17:90b:1102:b0:263:ebab:a152 with SMTP id
 gi2-20020a17090b110200b00263ebaba152mr8706038pjb.19.1690823842533; Mon, 31
 Jul 2023 10:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230730131750.16552-1-tuananhlfc@gmail.com>
In-Reply-To: <20230730131750.16552-1-tuananhlfc@gmail.com>
Date: Mon, 31 Jul 2023 10:17:11 -0700
Message-ID: <CAKH8qBtNaEW4pEj7Y1WiLoPk2aMPoq3AuO14D=OF_NCN255awQ@mail.gmail.com>
Subject: Re: [PATCH v3] samples/bpf: Fix build out of source tree
To: Anh Tuan Phan <tuananhlfc@gmail.com>
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gU3VuLCBKdWwgMzAsIDIwMjMgYXQgNjoxOOKAr0FNIEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhs
ZmNAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoaXMgY29tbWl0IGZpeGVzIGEgZmV3IGNvbXBpbGF0
aW9uIGlzc3VlcyB3aGVuIGJ1aWxkaW5nIG91dCBvZiBzb3VyY2UKPiB0cmVlLiBUaGUgY29tbWFu
ZCB0aGF0IEkgdXNlZCB0byBidWlsZCBzYW1wbGVzL2JwZjoKPgo+IGV4cG9ydCBLQlVJTERfT1VU
UFVUPS90bXAKPiBtYWtlIFY9MSBNPXNhbXBsZXMvYnBmCj4KPiBUaGUgY29tcGlsYXRpb24gZmFp
bGVkIHNpbmNlIGl0IHRyaWVkIHRvIGZpbmQgdGhlIGhlYWRlciBmaWxlcyBpbiB0aGUKPiB3cm9u
ZyBwbGFjZXMgYmV0d2VlbiBvdXRwdXQgZGlyZWN0b3J5IGFuZCBzb3VyY2UgdHJlZSBkaXJlY3Rv
cnkKClN0aWxsIGRvZXNuJ3QgYXBwbHkgY2xlYW5seSwgbW9zdCBsaWtlbHkgZHVlIHRvIGNvbW1p
dCBiYmFmMWZmMDZhZjQKKCJicGY6IFJlcGxhY2UgZGVwcmVjYXRlZCAtdGFyZ2V0IHdpdGggLS10
YXJnZXQ9IGZvciBDbGFuZyIpLgpQbGVhc2UgcmViYXNlIGFuZCByZXBvc3QuIEFsc28gYWRkIFtQ
QVRDSCBicGYtbmV4dCB2NF0gdGFnLgoKCj4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8
dHVhbmFuaGxmY0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBmcm9tIHYxOgo+IC0gVW5jb25k
aXRpb25hbGx5IGFkZCAiLUkgJChvYmp0cmVlKS8kKG9iaikiIHRvIF90cHJvZ2NfZmxhZ3MgYW5k
IGRyb3AgdW5uZWNlc3NhcnkgcGFydAo+IFJlZmVyZW5jZToKPiAtIHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvNjdiZWM2YTktYWY1OS1kNmY5LTI2MzAtMTcyODA0NzlhMWY3QGdtYWls
LmNvbS8KPiAtIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMmJhMWMwNzYtZjViZi00
MzJmLTUwYzEtNzJjODQ1NDAzMTY3QGdtYWlsLmNvbS8KPiAtLS0KPiAgc2FtcGxlcy9icGYvTWFr
ZWZpbGUgICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBzYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJn
ZXQgfCAgOSArLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvYnBmL01ha2VmaWxlIGIvc2Ft
cGxlcy9icGYvTWFrZWZpbGUKPiBpbmRleCA2MTVmMjRlYmM0OWMuLmNmYzk2MGIzNzEzYSAxMDA2
NDQKPiAtLS0gYS9zYW1wbGVzL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3NhbXBsZXMvYnBmL01ha2Vm
aWxlCj4gQEAgLTM0MSwxMCArMzQxLDEwIEBAICQob2JqKS9oYm1fZWR0X2tlcm4ubzogJChzcmMp
L2hibS5oICQoc3JjKS9oYm1fa2Vybi5oCj4gICMgT3ZlcnJpZGUgaW5jbHVkZXMgZm9yIHhkcF9z
YW1wbGVfdXNlci5vIGJlY2F1c2UgJChzcmN0cmVlKS91c3IvaW5jbHVkZSBpbgo+ICAjIFRQUk9H
U19DRkxBR1MgY2F1c2VzIGNvbmZsaWN0cwo+ICBYRFBfU0FNUExFX0NGTEFHUyArPSAtV2FsbCAt
TzIgXAo+IC0gICAgICAgICAgICAgICAgICAgIC1JJChzcmMpLy4uLy4uL3Rvb2xzL2luY2x1ZGUg
XAo+IC0gICAgICAgICAgICAgICAgICAgIC1JJChzcmMpLy4uLy4uL3Rvb2xzL2luY2x1ZGUvdWFw
aSBcCj4gKyAgICAgICAgICAgICAgICAgICAgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUgXAo+
ICsgICAgICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkgXAo+
ICAgICAgICAgICAgICAgICAgICAgIC1JJChMSUJCUEZfSU5DTFVERSkgXAo+IC0gICAgICAgICAg
ICAgICAgICAgIC1JJChzcmMpLy4uLy4uL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZgo+ICsg
ICAgICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYKPgo+ICAkKG9iaikvJChYRFBfU0FNUExFKTogVFBST0dTX0NGTEFHUyA9ICQoWERQX1NBTVBM
RV9DRkxBR1MpCj4gICQob2JqKS8kKFhEUF9TQU1QTEUpOiAkKHNyYykveGRwX3NhbXBsZV91c2Vy
LmggJChzcmMpL3hkcF9zYW1wbGVfc2hhcmVkLmgKPiBAQCAtMzkzLDcgKzM5Myw3IEBAICQob2Jq
KS94ZHBfcm91dGVyX2lwdjQuYnBmLm86ICQob2JqKS94ZHBfc2FtcGxlLmJwZi5vCj4gICQob2Jq
KS8lLmJwZi5vOiAkKHNyYykvJS5icGYuYyAkKG9iaikvdm1saW51eC5oICQoc3JjKS94ZHBfc2Ft
cGxlLmJwZi5oICQoc3JjKS94ZHBfc2FtcGxlX3NoYXJlZC5oCj4gICAgICAgICBAZWNobyAiICBD
TEFORy1CUEYgIiAkQAo+ICAgICAgICAgJChRKSQoQ0xBTkcpIC1nIC1PMiAtdGFyZ2V0IGJwZiAt
RF9fVEFSR0VUX0FSQ0hfJChTUkNBUkNIKSBcCj4gLSAgICAgICAgICAgICAgIC1Xbm8tY29tcGFy
ZS1kaXN0aW5jdC1wb2ludGVyLXR5cGVzIC1JJChzcmN0cmVlKS9pbmNsdWRlIFwKPiArICAgICAg
ICAgICAgICAgLVduby1jb21wYXJlLWRpc3RpbmN0LXBvaW50ZXItdHlwZXMgLUkkKG9iaikgLUkk
KHNyY3RyZWUpL2luY2x1ZGUgXAo+ICAgICAgICAgICAgICAgICAtSSQoc3JjdHJlZSkvc2FtcGxl
cy9icGYgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUgXAo+ICAgICAgICAgICAgICAgICAtSSQo
TElCQlBGX0lOQ0xVREUpICQoQ0xBTkdfU1lTX0lOQ0xVREVTKSBcCj4gICAgICAgICAgICAgICAg
IC1jICQoZmlsdGVyICUuYnBmLmMsJF4pIC1vICRACj4gQEAgLTQxMiw3ICs0MTIsNyBAQCB4ZHBf
cm91dGVyX2lwdjQuc2tlbC5oLWRlcHMgOj0geGRwX3JvdXRlcl9pcHY0LmJwZi5vIHhkcF9zYW1w
bGUuYnBmLm8KPgo+ICBMSU5LRURfQlBGX1NSQ1MgOj0gJChwYXRzdWJzdCAlLmJwZi5vLCUuYnBm
LmMsJChmb3JlYWNoIHNrZWwsJChMSU5LRURfU0tFTFMpLCQoJChza2VsKS1kZXBzKSkpCj4KPiAt
QlBGX1NSQ1NfTElOS0VEIDo9ICQobm90ZGlyICQod2lsZGNhcmQgJChzcmMpLyouYnBmLmMpKQo+
ICtCUEZfU1JDU19MSU5LRUQgOj0gJChub3RkaXIgJCh3aWxkY2FyZCAkKHNyY3RyZWUpLyQoc3Jj
KS8qLmJwZi5jKSkKPiAgQlBGX09CSlNfTElOS0VEIDo9ICQocGF0c3Vic3QgJS5icGYuYywkKG9i
aikvJS5icGYubywgJChCUEZfU1JDU19MSU5LRUQpKQo+ICBCUEZfU0tFTFNfTElOS0VEIDo9ICQo
YWRkcHJlZml4ICQob2JqKS8sJChMSU5LRURfU0tFTFMpKQo+Cj4gZGlmZiAtLWdpdCBhL3NhbXBs
ZXMvYnBmL01ha2VmaWxlLnRhcmdldCBiL3NhbXBsZXMvYnBmL01ha2VmaWxlLnRhcmdldAo+IGlu
ZGV4IDc2MjFmNTVlMjk0Ny4uZDJmYWI5NTk2NTJlIDEwMDY0NAo+IC0tLSBhL3NhbXBsZXMvYnBm
L01ha2VmaWxlLnRhcmdldAo+ICsrKyBiL3NhbXBsZXMvYnBmL01ha2VmaWxlLnRhcmdldAo+IEBA
IC0zOCwxNCArMzgsNyBAQCB0cHJvZy1jb2JqcyAgOj0gJChhZGRwcmVmaXggJChvYmopLywkKHRw
cm9nLWNvYmpzKSkKPiAgIyBIYW5kbGUgb3B0aW9ucyB0byBnY2MuIFN1cHBvcnQgYnVpbGRpbmcg
d2l0aCBzZXBhcmF0ZSBvdXRwdXQgZGlyZWN0b3J5Cj4KPiAgX3Rwcm9nY19mbGFncyAgID0gJChU
UFJPR1NfQ0ZMQUdTKSBcCj4gLSAgICAgICAgICAgICAgICAgJChUUFJPR0NGTEFHU18kKGJhc2V0
YXJnZXQpLm8pCj4gLQo+IC0jICQob2JqdHJlZSkvJChvYmopIGZvciBpbmNsdWRpbmcgZ2VuZXJh
dGVkIGhlYWRlcnMgZnJvbSBjaGVja2luIHNvdXJjZSBmaWxlcwo+IC1pZmVxICgkKEtCVUlMRF9F
WFRNT0QpLCkKPiAtaWZkZWYgYnVpbGRpbmdfb3V0X29mX3NyY3RyZWUKPiAtX3Rwcm9nY19mbGFn
cyAgICs9IC1JICQob2JqdHJlZSkvJChvYmopCj4gLWVuZGlmCj4gLWVuZGlmCj4gKyAgICAgICAg
ICAgICAgICAgLUkgJChvYmp0cmVlKS8kKG9iaikKPgo+ICB0cHJvZ2NfZmxhZ3MgICAgPSAtV3As
LU1ELCQoZGVwZmlsZSkgJChfdHByb2djX2ZsYWdzKQo+Cj4gLS0KPiAyLjM0LjEKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVu
dGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1rZXJuZWwtbWVudGVlcwo=
