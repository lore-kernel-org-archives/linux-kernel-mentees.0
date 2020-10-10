Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3C9C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:44:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF68A22509
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP8wruc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF68A22509
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55F7E86F0E;
	Sat, 10 Oct 2020 18:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zjLWL9ao136; Sat, 10 Oct 2020 18:44:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4DC586EDC;
	Sat, 10 Oct 2020 18:44:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B766C07FF;
	Sat, 10 Oct 2020 18:44:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78557C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 749EB86EDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm5wPFbriQFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE24086EDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:44:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y14so10112995pgf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gynpyUuQDJw4i2zEOnQ/TzhcGgZ8EQ2u4/0CzfNkcPA=;
 b=PP8wruc20jQM8T83GoLi/Knij4+w2yw9tO1aTlXlcIsTYNXpJyAV8Kfeq2zkxwSHFu
 bJDH3Qv2ziU1I6RrSFSyCujLEyo1GAEqoODxL5gwNVaoMfCnBiRtxcH4g2izXFZy90bz
 1H+su+nHeimqvt98MprOMJPquTyyWz8CvfnGRRA5c9IIK4Mt1AJ3FoCPRbPo2Mw4KqDh
 J7B1rv7L5U42qX78zV9UA0H34TrmKTnFd08PecGMaqX90TyN7ZCqc35JMAnp912MJYRC
 IZ1hIE4V68kwMSeFOAvcz6t+T5DpRNLf69Z97oh3HkMoO4VFhbye5je/i1dBWIjRjyxQ
 p4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gynpyUuQDJw4i2zEOnQ/TzhcGgZ8EQ2u4/0CzfNkcPA=;
 b=XLNeMoErpP/ho7LybUvSJ6IFi3aENxr/CFbZra/rvds+K2k+mxA/SVo3eRjhFPRSKo
 lAmfXiaaLrwUdhThZYeSA8m/qn0OBbj9sla+dgVq6UR5W8MkvPXKMswuuUR+I5uzWmoZ
 f5w9j6/ixo9J3qX37wdrj8ug1nz4TLX15gUtfwMrFVoaxV8//F9/ky0iX0V/Z2kB0eut
 cPC7Rdp2bEazNgvS1VW7hQUkPWev4x+lcAYlTkIcqKppU+TSz2P+NeV+v/Ha73rweAE1
 IxoetzFRgM7GbpXk8H2r0RQ8XmwHT2sVErPA+ZVg1KPFbW9y7Rnj2LiysTFIO5bCO5W7
 DxRA==
X-Gm-Message-State: AOAM533pqbRQtVASIXSiC54pvDXpI1WYRv4qvylSP4TxbopdeW1r4Wwz
 HayciyXkhzX1o9RCo9OtEgM=
X-Google-Smtp-Source: ABdhPJxb3+zbTfMJcsyP1PxCgumZYXS1XW5ek5s8hcWpHWs2UUAnHPFE+FPOSUMIZEmMuR/zho2IAQ==
X-Received: by 2002:a17:90a:c297:: with SMTP id
 f23mr8599068pjt.72.1602355451020; 
 Sat, 10 Oct 2020 11:44:11 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id u69sm16023601pfc.27.2020.10.10.11.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 11:44:10 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201010095302.5309c118@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <0de8e509-7ca5-7faf-70bf-5880ce0fc15c@gmail.com>
 <20201010111645.334647af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <e772b9f0-f5cd-c50b-86a7-fde22b6e13e3@gmail.com>
Date: Sun, 11 Oct 2020 00:14:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010111645.334647af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

Ck9uIDEwLzEwLzIwIDExOjQ2IHBtLCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPiBPbiBTYXQsIDEw
IE9jdCAyMDIwIDIzOjM0OjUxICswNTMwIEFuYW50IFRoYXpoZW1hZGFtIHdyb3RlOgo+PiBPbiAx
MC8xMC8yMCAxMDoyOSBwbSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4+PiBPbiBTYXQsIDEwIE9j
dCAyMDIwIDEyOjE0OjU5ICswNTMwIEFuYW50IFRoYXpoZW1hZGFtIHdyb3RlOiAgCj4+Pj4gZ2V0
X3JlZ2lzdGVycygpIGRpcmVjdGx5IHJldHVybnMgdGhlIHJldHVybiB2YWx1ZSBvZgo+Pj4+IHVz
Yl9jb250cm9sX21zZ19yZWN2KCkgLSAwIGlmIHN1Y2Nlc3NmdWwsIGFuZCBuZWdhdGl2ZSBlcnJv
ciBudW1iZXIgCj4+Pj4gb3RoZXJ3aXNlLiAgCj4+PiBBcmUgeW91IGV4cGVjdGluZyBHcmVnIHRv
IHRha2UgdGhpcyBhcyBhIHBhcnQgb2Ygc29tZSBVU0Igc3Vic3lzdGVtCj4+PiBjaGFuZ2VzPyBJ
IGRvbid0IHNlZSB1c2JfY29udHJvbF9tc2dfcmVjdigpIGluIG15IHRyZWUsIGFuZCB0aGUKPj4+
IHNlbWFudGljcyBvZiB1c2JfY29udHJvbF9tc2coKSBhcmUgbm90IHdoYXQgeW91IGRlc2NyaWJl
ZC4gIAo+PiBObywgSSdtIG5vdC4gdXNiX2NvbnRyb2xfbXNnX3JlY3YoKSBpcyBhbiBBUEkgdGhh
dCB3YXMgcmVjZW50bHkKPj4gaW50cm9kdWNlZCwgYW5kIGdldF9yZWdpc3RlcnMoKSBpbiBydGw4
MTUwLmMgd2FzIGFsc28gbW9kaWZpZWQgdG8KPj4gdXNlIGl0IGluIG9yZGVyIHRvIHByZXZlbnQg
cGFydGlhbCByZWFkcy4KPj4KPj4gQnkgeW91ciB0cmVlLCBJIGFzc3VtZSB5b3UgbWVhbgo+PiDC
oMKgwqAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva3Vi
YS9saW51eC5naXQvCj4+IChpdCB3YXMgdGhlIG9ubHkgb25lIEkgY291bGQgZmluZCkuCj4+Cj4+
IEkgZG9uJ3Qgc2VlIHRoZSBjb21taXQgdGhhdCB0aGlzIHBhdGNoIGlzIHN1cHBvc2VkIHRvIGZp
eCBpbiB5b3VyCj4+IHRyZWUgZWl0aGVyLi4uIDovCj4+Cj4+IE5vbmV0aGVsZXNzLCB0aGlzIGNv
bW1pdCBmaXhlcyBhbiBpc3N1ZSB0aGF0IHdhcyBhcHBsaWVkIHRvIHRoZQo+PiBuZXR3b3JraW5n
IHRyZWUsIGFuZCBoYXMgbWFkZSBpdHMgd2F5IGludG8gbGludXgtbmV4dCBhcyB3ZWxsLCBpZgo+
PiBJJ20gbm90IG1pc3Rha2VuLgo+IEkgbWVhbiB0aGUgbmV0d29ya2luZyB0cmVlLCB3aGF0J3Mg
dGhlIGNvbW1pdCBJRCBpbiBsaW51eC1uZXh0Pwo+Cj4gWW91ciBmaXhlcyB0YWcgcG9pbnRzIHRv
IGY0NWE0MjQ4ZWE0YywgYnV0IGxvb2tzIGxpa2UgdGhlIGNvZGUgd2FzCj4gcXVpdGUgY29ycmVj
dCBhdCB0aGF0IHBvaW50LgoKCkFoLCBteSBhcG9sb2dpZXMuIFlvdSdyZSByaWdodC4gSXQgZG9l
c24ndCBsb29rIGxpa2UgdGhvc2UgaGVscGVycyBoYXZlIG1hZGUKdGhlaXIgd2F5IGludG8gdGhl
IG5ldHdvcmtpbmcgdHJlZSB5ZXQuCgooVGhpcyBnZXRzIG1lbnRpb25lZCBoZXJlIGFzIHdlbGws
CsKgwqDCoCBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL25ldGRldkB2Z2VyLmtlcm5lbC5v
cmcvbXNnMzU3ODQzLmh0bWwpCgpUaGUgY29tbWl0IElEIHBvaW50ZWQgdG8gYnkgdGhlIGZpeGVz
IHRhZyBpcyBjb3JyZWN0LgpUaGUgY2hhbmdlIGludHJvZHVjZWQgYnkgc2FpZCBjb21taXQgbG9v
a3MgcmlnaHQsIGJ1dCBpcyBsb2dpY2FsbHkgaW5jb3JyZWN0LgoKZ2V0X3JlZ2lzdGVycygpIGRp
cmVjdGx5IHJldHVybnMgdGhlIHJldHVybiB2YWx1ZSBvZiB1c2JfY29udHJvbF9tc2dfcmVjdigp
LAphbmQgdXNiX2NvbnRyb2xfbXNnX3JlY3YoKSByZXR1cm5zIDAgb24gc3VjY2VzcyBhbmQgbmVn
YXRpdmUgZXJyb3IgbnVtYmVyCm90aGVyd2lzZS4KCihZb3UgY2FuIGZpbmQgbW9yZSBhYm91dCB0
aGUgbmV3IGhlbHBlcnMgaGVyZQrCoMKgwqAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxzYS1k
ZXZlbC8yMDIwMDkxNDE1Mzc1Ni4zNDEyMTU2LTEtZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcv
ICkKClRoZSBjb21taXQgSUQgbWVudGlvbmVkIGludHJvZHVjZXMgYSBjaGFuZ2UgdGhhdCBpcyBz
dXBwb3NlZCB0byBjb3B5IG92ZXIKdGhlIGV0aGVybmV0IG9ubHkgd2hlbiBnZXRfcmVnaXN0ZXJz
KCkgc3VjY2VlZHMsIGkuZS4sIGEgY29tcGxldGUgcmVhZCBvY2N1cnMsCmFuZCBnZW5lcmF0ZSBh
bmQgc2V0IGEgcmFuZG9tIGV0aGVybmV0IGFkZHJlc3Mgb3RoZXJ3aXNlIChyZWFkaW5nIHRoZQpj
b21taXQgbWVzc2FnZSBzaG91bGQgZ2l2ZSBzb21lIG1vcmUgaW5zaWdodCkuCgpUaGUgY29uZGl0
aW9uIHRoYXQgY2hlY2tzIGlmIGdldF9yZWdpc3RlcnMoKSBzdWNjZWVkcyAoYXMgc3BlY2lmaWVk
IGluIGY0NWE0MjQ4ZWE0YykKd2FzLArCoMKgwqAgcmV0ID09IHNpemVvZihub2RlX2lkKQp3aGVy
ZSByZXQgaXMgdGhlIHJldHVybiB2YWx1ZSBvZiBnZXRfcmVnaXN0ZXJzKCkuCgpIb3dldmVyLCBy
ZXQgd2lsbCBuZXZlciBlcXVhbCBzaXplb2Yobm9kZV9pZCksIHNpbmNlIHJldCBjYW4gb25seSBi
ZSBlcXVhbCB0byAwCm9yIGEgbmVnYXRpdmUgbnVtYmVyLgoKVGh1cywgZXZlbiBpbiBjYXNlIHdo
ZXJlIGdldF9yZWdpc3RlcnMoKSBzdWNjZWVkcywgYSByYW5kb21seSBnZW5lcmF0ZWQgTUFDCmFk
ZHJlc3Mgd291bGQgZ2V0IGNvcGllZCBvdmVyLCBpbnN0ZWFkIG9mIGNvcHlpbmcgdGhlIGFwcHJv
cHJpYXRlIGV0aGVybmV0CmFkZHJlc3MsIHdoaWNoIGlzIGxvZ2ljYWxseSBpbmNvcnJlY3QgYW5k
IG5vdCBvcHRpbWFsLgoKSGVuY2UsIHdlIG5lZWQgdG8gbW9kaWZ5IHRoaXMgdG8gY2hlY2sgaWYg
KHJldCA9PSAwKSwgYW5kIGNvcHkgb3ZlciB0aGUgY29ycmVjdApldGhlcm5ldCBhZGRyZXNzIGlu
IHRoYXQgY2FzZSwgaW5zdGVhZCBvZiByYW5kb21seSBnZW5lcmF0aW5nIG9uZSBhbmQgYXNzaWdu
aW5nCnRoYXQuCkhvcGUgdGhpcyBoZWxwcy4KClRoYW5rcywKQW5hbnQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
