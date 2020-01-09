Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E37C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 20:52:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8F920721
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 20:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CegmGFs8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C8F920721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6944B86D53;
	Thu,  9 Jan 2020 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVZDBHsAOpaE; Thu,  9 Jan 2020 20:52:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0403186CDB;
	Thu,  9 Jan 2020 20:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0480C18DC;
	Thu,  9 Jan 2020 20:52:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04C68C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E81B0882A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63FCWsbSOHVY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C2C7880C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:52:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w127so7344993qkb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 12:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9dV4dltXerlwubIciikJuPDN6M7ksl3lmWUD+DcQSTg=;
 b=CegmGFs8q4AP1mQyeeji7+3hgq2VcMn2QGsuDntbXnAa214OpfPAc0o7elnATVTxXQ
 zab7secdAAX5OwmHi8W2k8wviitZ1cjYXRfZCS8MIHx8/rRUPROBqRPlYv+mhu3s2M6o
 vvEI/S2mwSqd1tSLL2VA2O3iqvHLRM2vi7LpED38t9fnoJd+pkbNuMyswgNhGF2TxuS6
 KrlMMOGgw3SpwQSJDwcJDXPlK04zlp38MUvjhtahIexQjnRpa9VR/1OljVdFhS6wAsHA
 BqQHAdcfDaLQWFemRRMgzK/X+8jvOqB9rl35PFu1ap2QcY5oc6rMM+OjDyyDJVNXnKQ4
 v7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9dV4dltXerlwubIciikJuPDN6M7ksl3lmWUD+DcQSTg=;
 b=qaIo4kvHsUKKZpL6AiG8VJvJ18M3ER6IEiLB7UBj9D6EpBjZUkTVeEpugW5SYrcucM
 x3te5wS1GKyB+N7p2kgTqBxqrMKi7SI15mQvOggwj6Y68uCzO7Ov7CgFYElXan1wzEr/
 8LX9OmftXu67v8t5fefMp7X8BrDSdx2Y8itbfaIsvPCOlV7oJoH/Mk6xrciyPoX9yvdj
 DuwWHOmchSFKeVj8uAM2Zu/g4FaG674rfyAJQGDOxAj4BpDa7ghSVW9GnzRwE3eEguMU
 dl3SMWctLBSnDv2id+MWZzuw1RoUKMPHAF+bkGEgda0cntWb21ZttaAa+fekB0q1Yde1
 Mfug==
X-Gm-Message-State: APjAAAVL5Pv+HyqmrL9ABNavuWoChaaiTo5L2fFI59+VAhmEtgsOQlKH
 xz4jvPTuh7C8LGNU2X3w7cW7oh0RCP0=
X-Google-Smtp-Source: APXvYqwMvl3bK+bLNhZbPmGK4nsePikAkTT0PWSf1e7tgtdAghfWRALxnrt23WIFx+pTYBkbzDk6OA==
X-Received: by 2002:a37:2dc5:: with SMTP id t188mr10877452qkh.97.1578603164320; 
 Thu, 09 Jan 2020 12:52:44 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id g81sm3666508qkb.70.2020.01.09.12.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 12:52:44 -0800 (PST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <20200109171345.2cf30990@kernel.org>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <bb66b7dc-b93c-2aee-a64a-fafc03fb296b@gmail.com>
Date: Thu, 9 Jan 2020 17:52:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109171345.2cf30990@kernel.org>
Content-Language: en-US
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Mauro!

> Actually, this is a dummy driver. It should not be auto-selected, as no
> real hardware depends on it. We don't want production distros to come with
> those test drivers.

Let's address this in v2.


Thanks.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
