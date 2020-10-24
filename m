Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8184CC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 09:28:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F19520936
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 09:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4HLe5iK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F19520936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA6B887674;
	Sat, 24 Oct 2020 09:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnWCmaFhOjZq; Sat, 24 Oct 2020 09:28:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FB0E87660;
	Sat, 24 Oct 2020 09:28:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85BEFC0052;
	Sat, 24 Oct 2020 09:28:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 783A0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5F354876E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nl2kdgzrSfVI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:28:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C1A1C876E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:28:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id az3so524944pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1x+p2HDoq+uPS1PcQClHUkWFKa3rEJTmQpkbNK8MKhU=;
 b=g4HLe5iKXuF+Joprfh0tPLgpDu3xwcRGr4QuNKTSN2vjiJDnpxZmJrGxD0VakKsUbp
 ZPX4yt8K9OgLR4EJqbrygFn+3b1Zl5KD87E6l/PKKMGRd32c9pKjVSNvZ/jS3a2pSMly
 E8498Y5Uq+Hs5mhOihubpmRssnIF9uufwm0Hlj+OUcLt5wnT6myT2peHpNrBAE3cQysB
 qvY0lozx+u4ZLPx5shDYto3Wb3x7aonb2+WIjQeIu7HbXXrHbOLhYWTf5VdiBkbY33EG
 E9v01iA/uXEjWXQjc/htJOgFSQMzBjqy5X332ig+ACbrGUn60GeLdgD7v6U3/6Ghz5/l
 kUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1x+p2HDoq+uPS1PcQClHUkWFKa3rEJTmQpkbNK8MKhU=;
 b=GjcMclDSM8bRrAznQDXZN19TbeCRJ5jLm57/ttYia4+Z6InxdUmGgKvsv0j9z4Cg6I
 0oxcq+amI0+/+FC1TXQywm/kadLalX+iWf0s1h11M/IasVjHrPj1iC3RfSZSDSVgKzGT
 +y1t/LuiK0uZZ62QNCDxv8UfbValaXmhhsOrv7QuHbxab3whxCjBQcgDvTMjQO5HeG8p
 HlojzdAUGX+7S4g4v8oDM2mc9sRt5YIP4fLaKCa2qOydrTyZiLRusvpS9/NKFBg61bUT
 GkRvAMOypeOHmt911bReY/O8wPLKax54u/T6+f3AudQTvzgQjONKd9JYOQEcSL34fBQb
 /IWA==
X-Gm-Message-State: AOAM531leZmkTLQfyYM9VLar35hYqelZ9PL7dJwLFmeG4M1f1vgUxzPY
 GWO0ArU94nD4LtzkVXCGYao=
X-Google-Smtp-Source: ABdhPJxc1DCcHItcrTy6gNBtJHDoq/kqKDnFB5iPsYC1pIC/WzD2f2uxZx28hrjrjLA359L0BTmdpQ==
X-Received: by 2002:a17:902:c24b:b029:d5:f14a:318d with SMTP id
 11-20020a170902c24bb02900d5f14a318dmr3707444plg.4.1603531705218; 
 Sat, 24 Oct 2020 02:28:25 -0700 (PDT)
Received: from ?IPv6:2402:3a80:40f:9156:55ee:fad5:f15e:347e?
 ([2402:3a80:40f:9156:55ee:fad5:f15e:347e])
 by smtp.gmail.com with ESMTPSA id 8sm5738229pjk.20.2020.10.24.02.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Oct 2020 02:28:24 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201024000830.12871-1-yashsri421@gmail.com>
 <5bc34c6faf989f528c92f5e631607f1774f08d20.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c4432b0c-3e21-20ec-d439-cdfebc283148@gmail.com>
Date: Sat, 24 Oct 2020 14:58:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5bc34c6faf989f528c92f5e631607f1774f08d20.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: fix false
 positives in REPEATED_WORD warning
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

T24gMjQvMTAvMjAgNzowNyBhbSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gU2F0LCAyMDIwLTEw
LTI0IGF0IDA1OjM4ICswNTMwLCBBZGl0eWEgU3JpdmFzdGF2YSB3cm90ZTogCj4+IEEgcXVpY2sg
ZXZhbHVhdGlvbiBvbiB2NS42Li52NS44IHNob3dlZCB0aGF0IHRoaXMgZml4IHJlZHVjZXMKPj4g
UkVQRUFURURfV09SRCB3YXJuaW5ncyBmcm9tIDI3OTcgdG8gOTA3Lgo+IAo+IEhvdyBtYW55IG9m
IHRoZXNlIDkwNyByZW1haW5pbmcgYXJlIHN0aWxsIGZhbHNlIHBvc2l0aXZlPwo+ICAKPj4gQSBx
dWljayBtYW51YWwgY2hlY2sgZm91bmQgYWxsIGNhc2VzIGFyZSByZWxhdGVkIHRvIGhleCBvdXRw
dXQgb3IKPj4gbGlzdCBjb21tYW5kIG91dHB1dHMgaW4gY29tbWl0IG1lc3NhZ2VzLgo+IAo+IFlv
dSBtZWFuIDE4OTAgb2YgdGhlIDI3OTcgYXJlIG5vdyBubyBsb25nZXIgcmVwb3J0ZWQgYW5kIGFs
bCAxODkwCj4gd2VyZSBmYWxzZSBwb3NpdGl2ZXMgeWVzPwo+IAoKWWVzLiBJbiB2NS42Li41Ljgs
IHRoZXJlIHdlcmUgMjc5NyB3YXJuaW5ncyBmb3IgUkVQRUFURURfV09SRCwgYWZ0ZXIKdGhlc2Ug
Y2hhbmdlcywgdGhleSBhcmUgcmVkdWNlZCB0byA5MDcuCkhvd2V2ZXIsIG1hbnkgYW1vbmcgdGhl
c2UgOTA3IG11c3QgaGF2ZSBiZWVuIGZpeGVkIGJ5IER3YWlwYXlhbidzCnBhdGNoLiBJJ2xsIHJl
cGxhY2UgaXQgd2l0aCAxODkwIGluc3RlYWQsIGZvciB0aGUgYmV0dGVyLgoKPj4gwqAJCQlwb3Mo
JHJhd2xpbmUpID0gMSBpZiAoISRpbl9jb21taXRfbG9nKTsKPj4gwqAJCQl3aGlsZSAoJHJhd2xp
bmUgPX4gL1xiKCR3b3JkX3BhdHRlcm4pICg/PSgkd29yZF9wYXR0ZXJuKSkvZykgewo+PiDCoAo+
Pgo+PiBAQCAtMzA3NCw2ICszMDc2LDE3IEBAIHN1YiBwcm9jZXNzIHsKPj4gwqAJCQkJbmV4dCBp
ZiAoJHN0YXJ0X2NoYXIgPX4gL15cUyQvKTsKPj4gwqAJCQkJbmV4dCBpZiAoaW5kZXgoIiBcdC4s
Oz8hIiwgJGVuZF9jaGFyKSA9PSAtMSk7Cj4+IMKgCj4+Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICMgYXZvaWQgcmVwZWF0aW5nIGhleCBvY2N1cnJlbmNlcyBsaWtlICdmZiBm
ZiBmZSAwOSAuLi4nCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG15ICVhbGxv
d19yZXBlYXRlZF93b3JkcyA9ICgKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhZGQgPT4gJycsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYWRkZWQgPT4gJycsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmFkID0+ICcnLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJlID0+ICcnLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICApOwo+IAo+
IElmIHBlcmwgY2FjaGVzIHRoaXMgbG9jYWwgaGFzaCBkZWNsYXJhdGlvbiwgZmluZSwKPiBidXQg
SSB0aGluayBpdCBiZXR0ZXIgdG8gdXNlICdvdXIgJWFsbG93X3JlcGVhdGVkX3dvcmRzJwo+IGFu
ZCBtb3ZlIGl0IHNvIGl0J3Mgb25seSBkZWNsYXJlZCB1c2luZyB0aGUgZmlsZSBzY29wZS4KPiAK
CkkgcmFuIGNoZWNrcGF0Y2ggb3ZlciBmZXcgY29tbWl0cywgaXQgd2FzIHdvcmtpbmcgZmluZS4g
QnV0IEknbGwgbW92ZQppdCB0byBmaWxlIHNjb3BlLCB1c2luZyAnb3VyJy4gVGhhdCBzaG91bGQg
ZG8gYXMgd2VsbC4KCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgkZmly
c3QgPX4gL1xiWzAtOWEtZl17Mix9XGIvKSB7Cj4gCj4gVGhpcyByZWdleCBtYXRjaGVzIG9ubHkg
bG93ZXIgY2FzZSBzbyBpdCB3b3VsZG4ndCBtYXRjaCAiQWRkIi4KPiAKPiBJIHRoaW5rIHRoaXMg
cmVnZXggd291bGQgYmUgY2xlYXJlciB1c2luZwo+IAkvXlswLTlhLWZdKyQvaSBvciAvXltBLUZh
LWYwLTldKyQvCj4gCj4gCgpNaXNzZWQgaXQuIFdpbGwgZG8uCgpUaGFua3MKQWRpdHlhCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1t
ZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
