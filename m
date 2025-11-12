Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E126B96A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762981364; cv=none; b=jqRfDbp5Qblfc23xgAJEk/puaQvH0wSORJNXUnuiQXZ5Stq59tzHATc8OnKIOK78jlVSKEXONT7IQFP21yJ131KE3UL/FLF8hYTfc+sXo7C6RelbeLVEY8YqmlVEN30Ts6KDSnzOmr3wcBOLp51KEz1DXOpVnu7qy2HVm9Kfaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762981364; c=relaxed/simple;
	bh=2xhUvtMSX2Py/tg024qnleIQO6c6FibNRMJPrHXfmX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSL7y6ya+ujYN5JgCgRPhryi5jq+SqxlxyEjRrTUXcxIbfhaACvF3Ph0zdAjVYQH/j4coDbQ7VLxL0cEZIY3DrjBbaZcmscn7mfrt+sawF/IgV9yYYxEQYX4N3mrEXbzw99rYOgwSVuzDzzG41lDMV6ERR0Vb6Z8hwbp3QhspnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=FT4eMaE3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="FT4eMaE3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B4794004A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXlEMX7N2G3g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Nov 2025 21:02:41 +0000 (UTC)
X-Greylist: delayed 404 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 12 Nov 2025 21:02:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D33E40098
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=acm.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D33E40098
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FT4eMaE3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.3.6; helo=003.mia.mailroute.net; envelope-from=bvanassche@acm.org; receiver=<UNKNOWN> 
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D33E40098
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4d6Fzw4B9czlgqW0;
	Wed, 12 Nov 2025 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1762980954; x=1765572955; bh=BYieuYvWdrPkEWUDJXfeMQSD
	1AjAzeKuKjhOJWuyxQs=; b=FT4eMaE3uRQEtis8vd1tu3rVe/X5XL6vdlf113jI
	I0qIOsysyZLNtGa8JEYGN+SC4ydJrBrpMTy8NKCwiu50HjYAhvBSLJoFAvz3EuJf
	MVLZTprZ19vvpzREE/7xKWkf2tO7jfa1YPrueoxAuAfqU3/TFcPF4+BdCLCYF/Cq
	i21GE7r7kxgaHzmZEmfZLlK/5uI4Mkw6a8HQaTTm1FxH7OQNZNeQ6ZBCMMdgy4L6
	PWlJDA3ANjV2qmd4bRT2fuyB5OycbZHcAUBfikhk1fcPBdL7vupz3z7HB1eRLQF4
	IzVMYjJV3rf+kRvuHjJo7xMxTLQoYA5I2H9Ffbz/LlV6Pg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6RrlvvJ-mdZW; Wed, 12 Nov 2025 20:55:54 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4d6Fzj5yBRzltMJC;
	Wed, 12 Nov 2025 20:55:44 +0000 (UTC)
Message-ID: <562fa035-c732-4bfc-8439-2279d029f72a@acm.org>
Date: Wed, 12 Nov 2025 12:55:43 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] driver/scsi/mpi3mr: Fix build warning for
 mpi3mr_start_watchdog
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
 sathya.prakash@broadcom.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com
Cc: martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 7:55 AM, Bartlomiej Kubik wrote:
> -	char watchdog_work_q_name[50];
> +	char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];

 From include/linux/workqueue.h:

	WQ_NAME_LEN		= 32,

	char			name[WQ_NAME_LEN]; /* I: workqueue name */

In other words, increasing the workqueue name length beyond 32
characters is not useful because it will get truncated to 32 characters
anyway. The workqueue implementation complains about longer names as one
can see in kernel/workqueue.c:

	if (name_len >= WQ_NAME_LEN)
		pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
			     wq->name);

> diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> index 8fe6e0bf342e..18b176e358c5 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> @@ -2879,8 +2879,7 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)
> 
>   	INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
>   	snprintf(mrioc->watchdog_work_q_name,
> -	    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
> -	    mrioc->id);
> +	    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s", mrioc->name);
>   	mrioc->watchdog_work_q = alloc_ordered_workqueue(
>   		"%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
>   	if (!mrioc->watchdog_work_q) {
Leaving out mrioc->id from the workqueue name seems like an unacceptable
behavior change to me.

Please consider replacing the proposed changed with this untested patch:

diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
index 6742684e2990..050dcf111a4c 100644
--- a/drivers/scsi/mpi3mr/mpi3mr.h
+++ b/drivers/scsi/mpi3mr/mpi3mr.h
@@ -1076,7 +1076,6 @@ struct scmd_priv {
   * @fwevt_worker_thread: Firmware event worker thread
   * @fwevt_lock: Firmware event lock
   * @fwevt_list: Firmware event list
- * @watchdog_work_q_name: Fault watchdog worker thread name
   * @watchdog_work_q: Fault watchdog worker thread
   * @watchdog_work: Fault watchdog work
   * @watchdog_lock: Fault watchdog lock
@@ -1265,7 +1264,6 @@ struct mpi3mr_ioc {
  	spinlock_t fwevt_lock;
  	struct list_head fwevt_list;

-	char watchdog_work_q_name[50];
  	struct workqueue_struct *watchdog_work_q;
  	struct delayed_work watchdog_work;
  	spinlock_t watchdog_lock;
diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c 
b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index 8fe6e0bf342e..b564fe5980a6 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -2878,11 +2878,8 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)
  		return;

  	INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
-	snprintf(mrioc->watchdog_work_q_name,
-	    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
-	    mrioc->id);
  	mrioc->watchdog_work_q = alloc_ordered_workqueue(
-		"%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
+		"watchdog_%s%d", WQ_MEM_RECLAIM, mrioc->name, mrioc->id);
  	if (!mrioc->watchdog_work_q) {
  		ioc_err(mrioc, "%s: failed (line=%d)\n", __func__, __LINE__);
  		return;

Thanks,

Bart.
