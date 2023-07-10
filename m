Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BECEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 12:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2333E811F4;
	Mon, 10 Jul 2023 12:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2333E811F4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oj2XFuSg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pm-bHtEfOzdp; Mon, 10 Jul 2023 12:58:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CAD0880FB5;
	Mon, 10 Jul 2023 12:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD0880FB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6BE1C0072;
	Mon, 10 Jul 2023 12:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1C0FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 12:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE61C408C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 12:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE61C408C8
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oj2XFuSg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29KJ5115g_Ej
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 12:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F2C4089B
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65F2C4089B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 12:58:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b852785a65so28576475ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688993934; x=1691585934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q9L8qD0X2vq74e+v0kZxcRU61ZAt6WRkkLMg8q0MrwU=;
 b=oj2XFuSgzkJvH+IOFlqGA+IKNT2pvvQz9x//gHRJcqdQY8ILtMS+O6HbEWReSZydR1
 13CYXUt/8YddkmyMAip4YtjRcqRxWoeYAcxAXcCCAFOjpUVLucOPg3pvX+qQzYd/X0Nv
 LLxqeGoMk4t6a1xBjMCs0qiqKpuPpWAm1xqRDdOSXFq2Rbp52srW4Y8IzflHFw16kp5F
 2MzwnhoJ/NqCvYSqkpUVipP+fvB3RVcRxZPqEWA33Q5Y/Aoyecy1qgdmuI8UOtt0zXWo
 inkgo6PEGcHtRdSN92wI3qZljOgqq02ZgtGEvG3BETiPiwE3ZsN3AV3+FTyEdAkGnPL/
 v/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688993934; x=1691585934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q9L8qD0X2vq74e+v0kZxcRU61ZAt6WRkkLMg8q0MrwU=;
 b=Sek984156UybpSBpyhPIdJjPyPGS9U8yYWozjm4eHhfw15CiUJYhGbOh8Lm0Epf+04
 6HZzFRMfalPKozcIHN5pL86/JppfVKuJiS3s65JrqCpsYI0d+OYhDMFjPTkAdSGdKgMK
 h2/Y51kZKWh6ieGHkN/pwvT8iVZd32vCQ11qyoqE6Fm+nJj7E+U64ubtd4TAb9QQ85q4
 UPaAg7AOFaAwEluJwyWCavmVTdGCIX1j90pcF3R9Bmngjvs4VsJMFM834Hxrj8K8kSPo
 5IT/bFuw1aIjcjLp+muCfyweHBQhB1x5ls5Jg5t8EcP8Yg23+qWUNEW77r9NCXgrXIRE
 9OyA==
X-Gm-Message-State: ABy/qLaWzQoC7GzNUALJf+O1dlrEIU4Ln16BPeApEyNpFY0vrBM5rP0L
 y64BwI+5DD1baSWs78LuTLY=
X-Google-Smtp-Source: APBJJlHyHouPD+n5UmyiRi0Iugnev8RylTrKdtRfrlRfLmeUEYxNcx0QcpHlhlIy9VhDSZi3w9BzLA==
X-Received: by 2002:a17:903:41c2:b0:1b2:676d:1143 with SMTP id
 u2-20020a17090341c200b001b2676d1143mr19759555ple.15.1688993933585; 
 Mon, 10 Jul 2023 05:58:53 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 im15-20020a170902bb0f00b001b89536974bsm8406548plb.202.2023.07.10.05.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 05:58:53 -0700 (PDT)
Message-ID: <8db199b8-e339-8d7b-5ada-9210607d866f@gmail.com>
Date: Mon, 10 Jul 2023 19:58:50 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Khalid Masum <khalid.masum.92@gmail.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com>
 <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com>
 <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
 <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Cc: daniel@iogearbox.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andrii@kernel.org, ast@kernel.org, Stanislav Fomichev <sdf@google.com>,
 bpf@vger.kernel.org, martin.lau@linux.dev
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

CgpPbiA3LzkvMjMgMjI6MjEsIEtoYWxpZCBNYXN1bSB3cm90ZToKPiBIaSwKPiAKPiBPbiBTdW4s
IEp1bCA5LCAyMDIzIGF0IDg6MzjigK9QTSBBbmggVHVhbiBQaGFuIDx0dWFuYW5obGZjQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIFN0YW5pc2xhdiwKPj4KPj4gSSBoYXZlIHVwZGF0ZWQgdGhl
IERvY3VtZW50YXRpb24gYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4gUGxlYXNlCj4+IHNl
ZSBpdCBpbiB0aGUgYmVsb3cgcGF0Y2guIFRoYW5rcyEKPj4KPj4gT24gNy83LzIzIDIzOjU3LCBT
dGFuaXNsYXYgRm9taWNoZXYgd3JvdGU6Cj4+PiBPbiAwNy8wNywgQW5oIFR1YW4gUGhhbiB3cm90
ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gNy83LzIzIDAxOjE2LCBTdGFuaXNsYXYgRm9taWNoZXYgd3Jv
dGU6Cj4+Pj4+IE9uIDA3LzA2LCBBbmggVHVhbiBQaGFuIHdyb3RlOgo+Pj4+Pj4gVXBkYXRlIHRo
ZSBEb2N1bWVudGF0aW9uIHRvIG1lbnRpb24gdGhhdCBzb21lIHNhbXBsZXMgcmVxdWlyZSBwYWhv
bGUKPj4+Pj4+IHYxLjE2IGFuZCBrZXJuZWwgYnVpbHQgd2l0aCBDT05GSUdfREVCVUdfSU5GT19C
VEY9eQo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhs
ZmNAZ21haWwuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgc2FtcGxlcy9icGYvUkVBRE1FLnJzdCB8
IDcgKysrKysrKwo+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Pj4+
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy9icGYvUkVBRE1FLnJzdCBiL3NhbXBsZXMvYnBm
L1JFQURNRS5yc3QKPj4+Pj4+IGluZGV4IDU3ZjkzZWRkMTk1Ny4uNjMxNTkyYjgzZDYwIDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvc2FtcGxlcy9icGYvUkVBRE1FLnJzdAo+Pj4+Pj4gKysrIGIvc2FtcGxl
cy9icGYvUkVBRE1FLnJzdAo+Pj4+Pj4gQEAgLTE0LDYgKzE0LDkgQEAgQ29tcGlsaW5nIHJlcXVp
cmVzIGhhdmluZyBpbnN0YWxsZWQ6Cj4+Pj4+PiAgTm90ZSB0aGF0IExMVk0ncyB0b29sICdsbGMn
IG11c3Qgc3VwcG9ydCB0YXJnZXQgJ2JwZicsIGxpc3QgdmVyc2lvbgo+Pj4+Pj4gIGFuZCBzdXBw
b3J0ZWQgdGFyZ2V0cyB3aXRoIGNvbW1hbmQ6IGBgbGxjIC0tdmVyc2lvbmBgCj4+Pj4+Pgo+Pj4+
Pj4gK1NvbWUgc2FtcGxlcyByZXF1aXJlIHBhaG9sZSB2ZXJzaW9uIDEuMTYgYXMgYSBkZXBlbmRl
bmN5LiBTZWUKPj4+Pj4+ICtodHRwczovL2RvY3Mua2VybmVsLm9yZy9icGYvYnBmX2RldmVsX1FB
Lmh0bWwgZm9yIHJlZmVyZW5jZS4KPj4+Pj4+ICsKPj4+Pj4KPj4+Pj4gQW55IHJlYXNvbiBubyB0
byBhZGQgcGFob2xlIDEuMTYgdG8gdGhpcyBzZWN0aW9uIGFib3ZlPwo+Pj4+Pj4gQ29tcGlsaW5n
IHJlcXVpcmVzIGhhdmluZyBpbnN0YWxsZWQ6Cj4+Pj4+ICAqIGNsYW5nID49IHZlcnNpb24gMy40
LjAKPj4+Pj4gICogbGx2bSA+PSB2ZXJzaW9uIDMuNy4xCj4+Pj4+ICAqIHBhaG9sZSA+PSB2ZXJz
aW9uIDEuMTYKPj4+Pj4KPj4+Pj4gQWx0aG91Z2ggY2xhbmcgMy40IHByb2JhYmx5IHdvbid0IGdl
dCB5b3UgYW55d2hlcmUgdGhlc2UgZGF5cy4gVGhlCj4+Pj4+IHdob2xlIFJFQURNRSBzZWVtcyBh
IGJpdCBvdXRkYXRlZCA6LSkKPj4+Pj4KPj4+Pgo+Pj4+IFB1dCBwYWhvbGUgcmVxdWlyZW1lbnQg
YXMgeW91ciBpZGVhIGlzIGJldHRlciwgdGhhbmtzIGZvciBzdWdnZXN0aW9uLgo+Pj4+IFdpbGwg
dXBkYXRlIGl0IGFuZCBjbGFuZyB2ZXJzaW9uIGFzIHdlbGwuIEZvciBjbGFuZyB2ZXJzaW9uLCBJ
IHRoaW5rIEkKPj4+PiBjYW4gdXBkYXRlIG1pbiB2ZXJzaW9uIGFzIDExLjAuMCAocmVmZXJlbmNl
IGZyb20KPj4+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL25leHQvcHJvY2Vzcy9j
aGFuZ2VzLmh0bWwpLiBEbyB5b3Ugc2VlCj4+Pj4gYW55IG90aGVyIHBvdGVudGlhbCBvdXRkYXRl
ZCB0aGluZ3MgaW4gdGhpcyBkb2N1bWVudD8gSSBmb2xsb3cgdGhlIGFib3ZlCj4+Pj4gc3RlcHMg
YW5kIGl0IGhlbHAgbWUgY29tcGlsZSB0aGUgc2FtcGxlIGNvZGUgc3VjY2Vzc2Z1bGx5Lgo+Pj4K
Pj4+IE1heWJlIHdlIGNhbiByZWZlcmVuY2UgdGhhdCBkb2MgaW5zdGVhZCBoZXJlPyBPdGhlcndp
c2UgdGhhdCBjb3B5LXBhc3RlZAo+Pj4gMTEuMC4wIHdpbGwgYWxzbyBnZXQgb2xkLiBKdXN0IG1l
bnRpb24gaGVyZSB0aGF0IHdlIG5lZWQKPj4+IGNsYW5nL2xsdm0vcGFob2xlIHRvIGNvbXBpbGUg
dGhlIHNhbXBsZXMgYW5kIGZvciBzcGVjaWZpYyB2ZXJzaW9ucwo+Pj4gcHV0IGEgbGluayB0byBw
cm9jZXNzL2NoYW5nZXMucnN0Cj4+Pgo+Pj4+Pj4gIENsZWFuIGFuZCBjb25maWd1cmF0aW9uCj4+
Pj4+PiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+Cj4+Pj4+PiBAQCAtMjgsNiArMzEs
MTAgQEAgQ29uZmlndXJlIGtlcm5lbCwgZGVmY29uZmlnIGZvciBpbnN0YW5jZTo6Cj4+Pj4+Pgo+
Pj4+Pj4gICBtYWtlIGRlZmNvbmZpZwo+Pj4+Pj4KPj4+Pj4+ICtTb21lIHNhbXBsZXMgcmVxdWly
ZSBzdXBwb3J0IGZvciBCUEYgVHlwZSBGb3JtYXQgKEJURikuIFRvIGVuYWJsZSBpdCwKPj4+Pj4+
IG9wZW4gdGhlCj4+Pj4+PiArZ2VuZXJhdGVkIGNvbmZpZyBmaWxlLCBvciB1c2UgbWVudWNvbmZp
ZyAoYnkgIm1ha2UgbWVudWNvbmZpZyIpIHRvCj4+Pj4+PiBlbmFibGUgdGhlCj4+Pj4+PiArZm9s
bG93aW5nIGNvbmZpZ3M6IENPTkZJR19CUEZfU1lTQ0FMTCBhbmQgQ09ORklHX0RFQlVHX0lORk9f
QlRGLgo+Pj4+Pj4gKwo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIHVzdWFsbHkgZW5hYmxlZCBieSBkZWZh
dWx0LCBzbyB3aHkgc3BlY2lhbCBjYXNlIGl0IGhlcmU/Cj4+Pj4+IE1heWJlLCBpZiB5b3Ugd2Fu
dCBzb21lIGhpbnRzIGFib3V0IHRoZSBjb25maWcsIHdlIHNob3VsZCBhZGQKPj4+Pj4gYSByZWZl
cmVuY2UgdG8gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2NvbmZpZyA/Cj4+Pj4+Cj4+Pj4K
Pj4+PiBUaGUgY29uZmlnIENPTkZJR19ERUJVR19JTkZPX0JURiBpcyBkaXNhYmxlZCBmb3Igc29t
ZSBkaXN0cm9zIGF0IGxlYXN0Cj4+Pj4gZm9yIG1pbmUuIEkgcmFuICJtYWtlIGRlZmNvbmZpZyIg
YW5kIGl0J3Mgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCBzbyBJCj4+Pj4gdGhpbmsgaXQgd29ydGgg
dG8gbWVudGlvbiBpdCBoZXJlIHRvIGhlbHAgbm92aWNlIGdldCBzdGFydGVkLiBJJ2xsCj4+Pj4g
dXBkYXRlIGl0IHRvIHJlZmVyZW5jZSB0byB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29u
ZmlnIC4KPj4+Pgo+Pj4+Pj4gIEtlcm5lbCBoZWFkZXJzCj4+Pj4+PiAgLS0tLS0tLS0tLS0tLS0K
Pj4+Pj4+Cj4+Pj4+PiAtLQo+Pj4+Pj4gMi4zNC4xCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuaCBU
dWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwuY29tPgo+PiAtLS0KPj4KPj4gQ2hhbmdlIGZyb20g
dGhlIG9yaWdpbmFsIHBhdGNoOgo+Pgo+PiAtIE1vdmUgcGFob2xlIHRvIHRoZSBsaXN0IGluc3Rh
bGxlZCByZXF1aXJlbWVudHMKPj4gLSBSZW1vdmUgbWluaW1hbCB2ZXJzaW9uIGFuZCBsaW5rIHRo
ZSByZWxhdGVkIGRvYwo+PiAtIEFkZCBhIHJlZmVyZW5jZSBvZiBrZXJuZWwgY29uZmlndXJhdGlv
bgo+Pgo+PiAgc2FtcGxlcy9icGYvUkVBRE1FLnJzdCB8IDEwICsrKysrKystLS0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9zYW1wbGVzL2JwZi9SRUFETUUucnN0IGIvc2FtcGxlcy9icGYvUkVBRE1FLnJzdAo+PiBp
bmRleCA1N2Y5M2VkZDE5NTcuLmUxODUwMDc1M2JhNSAxMDA2NDQKPj4gLS0tIGEvc2FtcGxlcy9i
cGYvUkVBRE1FLnJzdAo+PiArKysgYi9zYW1wbGVzL2JwZi9SRUFETUUucnN0Cj4+IEBAIC04LDkg
KzgsMTIgQEAgQnVpbGQgZGVwZW5kZW5jaWVzCj4+ICA9PT09PT09PT09PT09PT09PT0KPj4KPj4g
IENvbXBpbGluZyByZXF1aXJlcyBoYXZpbmcgaW5zdGFsbGVkOgo+PiAtICogY2xhbmcgPj0gdmVy
c2lvbiAzLjQuMAo+PiAtICogbGx2bSA+PSB2ZXJzaW9uIDMuNy4xCj4+ICsgKiBjbGFuZwo+PiAr
ICogbGx2bQo+PiArICogcGFob2xlCj4+Cj4+ICtUaGUgbWluaW1hbCB2ZXJzaW9uIG9mIHRoZSBh
Ym92ZSBzb2Z0d2FyZSBpcyByZWZlcmVuY2VkIGluCj4+ICtodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL25leHQvcHJvY2Vzcy9jaGFuZ2VzLmh0bWwuCj4gCj4gSSB0aGluayBpdCBpcyBi
ZXR0ZXIgdG8gbm90IHVzZSBkb2NzIGZyb20gbGludXgtbmV4dCBhcyBpdCBrZWVwcyBjaGFuZ2lu
Zwo+IHRvbyBmcmVxdWVudGx5LiBIb3cgYWJvdXQgdXNpbmcgdGhlIGxhdGVzdCBkb2N1bWVudGF0
aW9uJ3MgbGluayBpbnN0ZWFkPyA6KQo+IAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0
bWwvbGF0ZXN0L3Byb2Nlc3MvY2hhbmdlcy5odG1sCj4gCj4gSG93ZXZlciwgc29tZXRoaW5nIHRv
IHRoaW5rIGFib3V0IGlzOiBJZiBmdXR1cmUgdmVyc2lvbnMgb2YgY2xhbmcsIGxsdm0gZXRjCj4g
ZG8gbm90IHN1cHBvcnQgY29tcGlsaW5nIG91ciBjb2RlIGFzIGl0IGlzIG5vdywgaXQgbWF5IGJl
Y29tZSBtaXNsZWFkaW5nLgo+IAoKVGhhbmtzLCBJJ2xsIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlv
bidzIGxpbmsgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4gCj4+ICBOb3RlIHRoYXQgTExWTSdzIHRv
b2wgJ2xsYycgbXVzdCBzdXBwb3J0IHRhcmdldCAnYnBmJywgbGlzdCB2ZXJzaW9uCj4+ICBhbmQg
c3VwcG9ydGVkIHRhcmdldHMgd2l0aCBjb21tYW5kOiBgYGxsYyAtLXZlcnNpb25gYAo+Pgo+PiBA
QCAtMjQsNyArMjcsOCBAQCBhZnRlciBzb21lIGNoYW5nZXMgKG9uIGRlbWFuZCk6Ogo+PiAgIG1h
a2UgLUMgc2FtcGxlcy9icGYgY2xlYW4KPj4gICBtYWtlIGNsZWFuCj4+Cj4+IC1Db25maWd1cmUg
a2VybmVsLCBkZWZjb25maWcgZm9yIGluc3RhbmNlOjoKPj4gK0NvbmZpZ3VyZSBrZXJuZWwsIGRl
ZmNvbmZpZyBmb3IgaW5zdGFuY2UKPj4gKyhzZWUgInRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9jb25maWciIGZvciBhIHJlZmVyZW5jZSBjb25maWcpOjoKPj4KPj4gICBtYWtlIGRlZmNvbmZp
Zwo+Pgo+PiAtLQo+IAo+IHRoYW5rcywKPiAgIC0tIEtoYWxpZCBNYXN1bQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
