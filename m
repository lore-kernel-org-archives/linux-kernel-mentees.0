Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96361C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 17:39:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE5A60EB7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 17:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BE5A60EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B7D60618;
	Fri, 30 Jul 2021 17:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Q96TVDqJSn8; Fri, 30 Jul 2021 17:39:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1096C605D9;
	Fri, 30 Jul 2021 17:39:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6E32C001A;
	Fri, 30 Jul 2021 17:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63DC2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 17:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C3DC839B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 17:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OabXrhmSj0jk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 17:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AA5D83843
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627666741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCAX2Kmv6swjeLPb8XTOG5P1FiP7p6CkcukVbAna/IY=;
 b=QBuCK+0wFVj4h2m77ztosQqqZfGP35WhQnmBZRYCoF73jQcCvtrJ6NnbrcbrzJ/XH4Z6+x
 Ygc8TeCZRd8c5vUbIaUPbC5mMkh7CL8Gh9kmDJgijZ9TtJrSrO3ZAdxkS/cES3vT1cjhu+
 4HYGa9Vd7EN9lHE8V8r9wnjleBSW+NI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-Fy0uqYjXO5io8ZNbxWST8w-1; Fri, 30 Jul 2021 13:37:44 -0400
X-MC-Unique: Fy0uqYjXO5io8ZNbxWST8w-1
Received: by mail-qk1-f199.google.com with SMTP id
 t191-20020a37aac80000b02903b9402486c5so6172322qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vCAX2Kmv6swjeLPb8XTOG5P1FiP7p6CkcukVbAna/IY=;
 b=XtRZlE3KXzMeQL1nhQNjHWoQzfm6Jw43fppmpYR3RiU+Ze/HaUogYSbhx13S6O4L9V
 yag8Vd8VuWh5dXobhISND8orRD30egER95mU3s+EP2K5FrWk8Hiqx664k/f3RHsgktQE
 D3f1M8s4nvY4D+PLG6xtJC2v4gXqYnpmYb4fRY0iaXG17WSmoZ+N01xgqo7iv9N9QTqc
 JkP8eFT5hnm8tJSA0TcR1FbF0/2vh6+TqX2ArLeiSacR9BBk2Z9MrRlujxGQMekt2uPQ
 C3ujpR8dek8Eg/xjg4f37xdTHVM+hpEKu5VdTLf0UxcYXy883W+uRHTPYYGaCWAkgmkB
 l87w==
X-Gm-Message-State: AOAM533cJ4KLvpBpkcMqmbHuj6CnYRLvqsfjWUczkfy7rMhaTfVZOasA
 6t8V3vbyq+e/MrPBsRkwAeU1XfsjlVtpP7aCBxKfbKenGWd3yUr3ZiuqmoAUSE3OjuxbxrJ/wh1
 JrRMZbRuqqemOZBiKkiKhBGvgb3giC2E3oxaIQz2IhDClp8KUXf5G70q+0gY34cus6T4zpb/NCI
 d+4NRMEOLsaZTHUfETcjNC
X-Received: by 2002:ac8:548a:: with SMTP id h10mr3208431qtq.89.1627666663822; 
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaE99KUbpDYu6wEAU0dWSDkIcZGkRC7mBhIpMTdzhBiTASsmfcotVAkvrC5BAu6v76Y1uh6Q==
X-Received: by 2002:ac8:548a:: with SMTP id h10mr3208401qtq.89.1627666663488; 
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
 by smtp.gmail.com with ESMTPSA id a20sm896826qtp.19.2021.07.30.10.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
Message-ID: <ac36ec31-df97-b2ce-39f1-182e6859a1a0@redhat.com>
Date: Fri, 30 Jul 2021 13:37:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=llong@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On 7/30/21 12:15 AM, Desmond Cheong Zhi Xi wrote:
> Hi,
>
> Following a discussion on the patch ("drm: use the lookup lock in
> drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
> helpers to make it convenient to compose lockdep checks together.
>
> This series includes the patch that introduces the new lockdep helpers,
> then utilizes these helpers in drm_is_current_master_locked in the
> following patch.
>
> Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]
>
> Best wishes,
> Desmond
>
> Desmond Cheong Zhi Xi (1):
>    drm: add lockdep assert to drm_is_current_master_locked
>
> Peter Zijlstra (1):
>    locking/lockdep: Provide lockdep_assert{,_once}() helpers
>
>   drivers/gpu/drm/drm_auth.c |  6 +++---
>   include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
>   2 files changed, 24 insertions(+), 23 deletions(-)
>
This patch series looks good to me.

Acked-by: Waiman Long <longman@redhat.com>

Thanks!

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
