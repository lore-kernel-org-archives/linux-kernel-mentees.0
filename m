Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68570C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:06:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BFA22795
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BFA22795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 93292204B3;
	Fri,  4 Dec 2020 10:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IQUd2+nCgdS; Fri,  4 Dec 2020 10:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B36020477;
	Fri,  4 Dec 2020 10:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AFAEC0FA8;
	Fri,  4 Dec 2020 10:06:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3ABB0C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 18550204B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNRjy2eCr8KC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:06:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0D6C520477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:06:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id l11so2844942plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zzTrdNftutVe8hIRxXL9S4BM8nND3L+cvOiVEJjpe8g=;
 b=bfqe7CWhDthYzEuXs8BihXx31kSv4NSUO79Q86hmE2q31eim1laoYbovCPmOintj+A
 58JQl3eN8z6gS53HmuoZmA9v0sAQkVfULiWwtcCukgyCEJDlMiEJSyEvN5oO/TzRlNHj
 qraJlhRXH10W4zSPXXriH+2PW8TvZxGrFsrrmQJjHR8Gq0YCN8vDuKuPrZaDmRKfVCvo
 Fqh+5qytRBp3qk/d1iemkYPH7NYH3kE7Pj1zbECnlb0ZvLC3IlPFoJIfLYZkjvuaHXGM
 BJw+Ui/av8I4aTr+KaXJ/0nG7ql/VVFsckRseOWknxKvSqonpQlB5sM/Idr/C4qmehN7
 XwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzTrdNftutVe8hIRxXL9S4BM8nND3L+cvOiVEJjpe8g=;
 b=lRPWWCu4LtbMDnf60L9yqDKX8RXgIgEWQYLeaHrO65PfOS7e0mOOYQyatZzQz/vOOF
 AUHgRtFlvnX813f/VxuRUCgk0Eh3Y0vbQy1v1JE4BjGJwJizmYh4kT+O6kmNzl1lh0BB
 pXuqG51wvv6f0zj6nm8JkSiybiLpxsDQrUmopssRweg61j2OYH7RlJVMTch989lOvpyl
 O+X+co4xznG6L/qefw4l/IRJxymuy+UYKRbhEU27cYnWL3Ltt4DZNEs7YH7rutHn0r2G
 e+Y6hViGMqOdRKvANZ7IofPWHcWtzcc7C7/9vE5hPyyjrSfVcV1ZfhG4Sdsg8WTuDB7d
 /lQQ==
X-Gm-Message-State: AOAM532A9tZc4Aklan+Gbxzu8cHw2eY9f6S0mDoqmAX+XZJAA6xqT8l6
 aCTs/Yq1cRdvmD5Z7fnaqrc=
X-Google-Smtp-Source: ABdhPJw/S70m7nomAimJ8M79ghC22pyF0pvfNZl/Pkj5iBe5rqODI3qPaShISTHU9azza7zEJIQXaQ==
X-Received: by 2002:a17:902:b182:b029:da:d0c:abac with SMTP id
 s2-20020a170902b182b02900da0d0cabacmr3211602plr.40.1607076403410; 
 Fri, 04 Dec 2020 02:06:43 -0800 (PST)
Received: from ?IPv6:2402:3a80:414:1e71:d059:d26:c75b:b30a?
 ([2402:3a80:414:1e71:d059:d26:c75b:b30a])
 by smtp.gmail.com with ESMTPSA id w14sm4403542pfj.53.2020.12.04.02.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 02:06:42 -0800 (PST)
To: Joe Perches <joe@perches.com>
References: <20201108134317.25400-1-yashsri421@gmail.com>
 <e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c1d7168c-2bc0-7de6-6590-a1752b4918fd@gmail.com>
Date: Fri, 4 Dec 2020 15:36:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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

T24gOS8xMS8yMCAxOjI3IGFtLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBTdW4sIDIwMjAtMTEt
MDggYXQgMTk6MTMgKzA1MzAsIEFkaXR5YSBTcml2YXN0YXZhIHdyb3RlOgo+PiBDdXJyZW50bHks
IGNoZWNrcGF0Y2ggd2FybnMgdXMgaWYgdGhlIGF1dGhvciBvZiB0aGUgY29tbWl0IHNpZ25zLW9m
Zgo+PiBhcyBjby1kZXZlbG9wZWQtYnkuCj4gW10KPj4gQSBxdWljayBtYW51YWwgY2hlY2sgZm91
bmQgb3V0IHRoYXQgYWxsIGZpeGVzIHdlcmUgY29ycmVjdCBpbiB0aG9zZQo+PiBjYXNlcy4KPiBb
XQo+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9jaGVja3Bh
dGNoLnBsCj4gW10KPj4gQEAgLTI4MjcsOCArMjgyNywxMSBAQCBzdWIgcHJvY2VzcyB7Cj4+IMKg
IyBDaGVjayBDby1kZXZlbG9wZWQtYnk6IGltbWVkaWF0ZWx5IGZvbGxvd2VkIGJ5IFNpZ25lZC1v
ZmYtYnk6IHdpdGggc2FtZSBuYW1lIGFuZCBlbWFpbAo+PiDCoAkJCWlmICgkc2lnbl9vZmYgPX4g
L15jby1kZXZlbG9wZWQtYnk6JC9pKSB7Cj4+IMKgCQkJCWlmICgkZW1haWwgZXEgJGF1dGhvcikg
ewo+PiAtCQkJCQlXQVJOKCJCQURfU0lHTl9PRkYiLAo+PiAtCQkJCQkgICAgICAiQ28tZGV2ZWxv
cGVkLWJ5OiBzaG91bGQgbm90IGJlIHVzZWQgdG8gYXR0cmlidXRlIG5vbWluYWwgcGF0Y2ggYXV0
aG9yICckYXV0aG9yJ1xuIiAuICIkaGVyZVxuIiAuICRyYXdsaW5lKTsKPj4gKwkJCQkJaWYgKFdB
Uk4oIkJBRF9TSUdOX09GRiIsCj4+ICsJCQkJCQkgIkNvLWRldmVsb3BlZC1ieTogc2hvdWxkIG5v
dCBiZSB1c2VkIHRvIGF0dHJpYnV0ZSBub21pbmFsIHBhdGNoIGF1dGhvciAnJGF1dGhvcidcbiIg
LiAiJGhlcmVcbiIgLiAkcmF3bGluZSkgJiYKPj4gKwkJCQkJICAgICRmaXgpIHsKPj4gKwkJCQkJ
CWZpeF9kZWxldGVfbGluZSgkZml4bGluZW5yLCAkcmF3bGluZSk7Cj4+ICsJCQkJCX0KPj4gwqAJ
CQkJfQo+PiDCoAkJCQlpZiAoIWRlZmluZWQgJGxpbmVzWyRsaW5lbnJdKSB7Cj4+IMKgCQkJCQlX
QVJOKCJCQURfU0lHTl9PRkYiLAo+IAo+IExvb2tzIE9LIHRvIG1lLgo+IAo+IEFub3RoZXIgb3B0
aW9uIG1pZ2h0IGJlIHRvIGFkZCBhIFNpZ25lZC1vZmYtYnk6IGxpbmUgZGVyaXZlZCBmcm9tCj4g
YW55ICJGcm9tOiIgbGluZSB3aGVuOgo+IAo+IAlpZiAoJGlzX3BhdGNoICYmICRoYXNfY29tbWl0
X2xvZyAmJiAkY2hrX3NpZ25vZmYpIHsKPiAJCWlmICgkc2lnbm9mZiA9PSAwKSB7Cj4gCQkJRVJS
T1IoIk1JU1NJTkdfU0lHTl9PRkYiLAo+IAkJCSAgICAgICJNaXNzaW5nIFNpZ25lZC1vZmYtYnk6
IGxpbmUocylcbiIpOwo+IAo+IGV0Yy4uLgo+IAoKSGkgSm9lCgpZb3UgcHJvYmFibHkgZm9yZ290
IHRvIEFjayB0aGlzIHBhdGNoLgoKVGhhbmtzCkFkaXR5YQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
