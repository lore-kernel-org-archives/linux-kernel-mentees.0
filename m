Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4BDEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Jul 2023 14:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8CC41735;
	Tue, 18 Jul 2023 14:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8CC41735
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MG/UOsgC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WULpTN_UUKHx; Tue, 18 Jul 2023 14:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ABFDD4168C;
	Tue, 18 Jul 2023 14:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFDD4168C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2E0C0072;
	Tue, 18 Jul 2023 14:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23C47C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 14:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2A5C4118A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 14:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A5C4118A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MG/UOsgC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPDYejWuL4pV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 14:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114E641174
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 114E641174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689691863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBGt2SzAF7AMCzOyrWV5Yk7myyiNLTut8pS4wJJgxo8=;
 b=MG/UOsgC6IinxaBPO02zvnWxcrbPrug72xRiHliis5ZvNQI8+KNkDbtZmUlXOlGhLsuVON
 VVXhPQCZPt0GmKEl0Ve9GlxeUYtNwnw3aGxo/PnI42ufTDb569TX9hhkGRpAwHAZ7HOqaV
 Iwsnj+8A8Gy7oC3CAFOZ+3hDMP/Q4/o=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-hSla4-ppOaGWBcRHad8LUg-1; Tue, 18 Jul 2023 10:50:55 -0400
X-MC-Unique: hSla4-ppOaGWBcRHad8LUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE29280BCA7;
 Tue, 18 Jul 2023 14:47:29 +0000 (UTC)
Received: from [10.22.34.6] (unknown [10.22.34.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46ABF1454145;
 Tue, 18 Jul 2023 14:47:29 +0000 (UTC)
Message-ID: <c88923d3-8027-6093-bb34-ba301b9f7d0a@redhat.com>
Date: Tue, 18 Jul 2023 10:47:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] kernel: locking: Updates return value check
To: Atul Kumar Pant <atulpant.linux@gmail.com>, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com
References: <20230716180657.44056-1-atulpant.linux@gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230716180657.44056-1-atulpant.linux@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org
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

On 7/16/23 14:06, Atul Kumar Pant wrote:
> Updating the check of return value from debugfs_create_file
> and debugfs_create_dir to use IS_ERR.
>
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>   kernel/locking/lock_events.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/locking/lock_events.c b/kernel/locking/lock_events.c
> index fa2c2f951c6b..e68d82099558 100644
> --- a/kernel/locking/lock_events.c
> +++ b/kernel/locking/lock_events.c
> @@ -146,7 +146,7 @@ static int __init init_lockevent_counts(void)
>   	struct dentry *d_counts = debugfs_create_dir(LOCK_EVENTS_DIR, NULL);
>   	int i;
>   
> -	if (!d_counts)
> +	if (IS_ERR(d_counts))
>   		goto out;
>   
>   	/*
> @@ -159,14 +159,14 @@ static int __init init_lockevent_counts(void)
>   	for (i = 0; i < lockevent_num; i++) {
>   		if (skip_lockevent(lockevent_names[i]))
>   			continue;
> -		if (!debugfs_create_file(lockevent_names[i], 0400, d_counts,
> -					 (void *)(long)i, &fops_lockevent))
> +		if (IS_ERR(debugfs_create_file(lockevent_names[i], 0400, d_counts,
> +					 (void *)(long)i, &fops_lockevent)))
>   			goto fail_undo;
>   	}
>   
> -	if (!debugfs_create_file(lockevent_names[LOCKEVENT_reset_cnts], 0200,
> +	if (IS_ERR(debugfs_create_file(lockevent_names[LOCKEVENT_reset_cnts], 0200,
>   				 d_counts, (void *)(long)LOCKEVENT_reset_cnts,
> -				 &fops_lockevent))
> +				 &fops_lockevent)))
>   		goto fail_undo;
>   
>   	return 0;

It looks good to me, though the chance of getting an error return is 
really slim unless there is something really wrong with the system.

Acked-by: Waiman Long <longman@redhat.com>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
