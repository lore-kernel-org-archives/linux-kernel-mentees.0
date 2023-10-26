Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC27C25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 14:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 704C1419CB;
	Thu, 26 Oct 2023 14:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704C1419CB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GGwVxgYV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HB8KHJUO3nmb; Thu, 26 Oct 2023 14:06:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1C7D0419CA;
	Thu, 26 Oct 2023 14:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C7D0419CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06BF3C0071;
	Thu, 26 Oct 2023 14:06:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 399BDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06AB1419CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 14:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06AB1419CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKKfX5eTDjz3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 14:06:26 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13FD740A01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 14:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13FD740A01
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-581f78a0206so498400eaf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698329185; x=1698933985;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UMRxjMTQXFHxvjWDVcH9G5p0ViyU6pIVUwK8NakCdi0=;
 b=GGwVxgYVZqi9a36ms9CoPApFRQYPHs70eWlkH73svcFqaBsuDCr4uprbhZRu3yptA4
 8BwRciB14j1jSl1QecS++LWLiFR5Cua3scPtYa3sFqq8svxDg9yJtTN/zsoJWjy8sSsj
 yX4sNzk011eNGGDuklpYm7QX14GOFgt7sffzFbU14zF/Wc0ojHXTtjJfeIqlMsGfZ5JO
 lIJYSAHnP9qVBOrOpTv7jxmzjSMkbed8pA6aQeDpG4rfFdlGeWIEpnkSu7xDUhWkk8l9
 SQVA88G2gUHrewZPiJd9+MGak9j8hS3icmksv5CkWGidUV+f8Qbx5p4+nlmX55KFzMRS
 ATsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698329185; x=1698933985;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMRxjMTQXFHxvjWDVcH9G5p0ViyU6pIVUwK8NakCdi0=;
 b=ki7pxkabS1N5dkz6bmeTqbVlGSl5IMyYsc0JAWjTp4SO+K9bSlukIK0ZZDwhnMBy9k
 B1WhuwUek0MfaMaJePsuAGdLU8MQ8+gpaZqczQunHIctHsMvPGhJJJEFVfgM8JgM7qLf
 s3Y1r0Ng0qIlx2hdnSsFGyxXlKJuebvoPoxm7Wxbdd5RDYmwuDMzI+3Xg+CqJcwqWqjt
 SXPXunm6F8FUkDou5Ymq9OpTMinDIkUpXb120bX4mgF1jn0zWc/zi6T/fo7Tlci6J/Fu
 ML4k8aWdDp5W6bz4WfMh4dRStPvop5mgI0lQ4d5ID1oOSBpgB0tV9YNOaE29McJvq8Ng
 e5Sg==
X-Gm-Message-State: AOJu0YzWwAJZmNNnot3d4E/mzi+LJDYuscTNzTLD5ko2iKnSR2O051eY
 /9dj95vWDHMLtJabvthPfQat/C48yvgqSsZKRfQ=
X-Google-Smtp-Source: AGHT+IE1c/OWGyPB9wSaQzk/Qw4Xv1uL4Qn/G7AzjRVRiOt0TZxkG7xyXaqVYkBrH/T6W1zcQOocGLF5py8thdnmhrk=
X-Received: by 2002:a4a:bb0f:0:b0:581:d922:e7f3 with SMTP id
 f15-20020a4abb0f000000b00581d922e7f3mr18533862oop.9.1698329184995; Thu, 26
 Oct 2023 07:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6fcb:0:b0:4f0:1250:dd51 with HTTP; Thu, 26 Oct 2023
 07:06:24 -0700 (PDT)
In-Reply-To: <20231026091222-mutt-send-email-mst@kernel.org>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 26 Oct 2023 16:06:24 +0200
Message-ID: <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: brauner@kernel.org, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, Abhinav Singh <singhabhinav9051571833@gmail.com>,
 mathieu.desnoyers@efficios.com, shakeelb@google.com, akpm@linux-foundation.org,
 surenb@google.com, michael.christie@oracle.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/26/23, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
>> This patch fixes the warning about directly dereferencing a pointer
>> tagged with __rcu annotation.
>>
>> Dereferencing the pointers tagged with __rcu directly should
>> always be avoided according to the docs. There is a rcu helper
>> functions rcu_dereference(...) to use when dereferencing a __rcu
>> pointer. This functions returns the non __rcu tagged pointer which
>> can be dereferenced just like a normal pointers.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>
> Well yes but these need to be called under rcu_read_lock.
> Who does it here?
> If no one then maybe you found an actual bug and we need to
> fix it not paper over it.
>

There is no bug here.

p is the newly created thread, ->real_cred was initialized just prior
to this code and there is nobody to whack the creds from under it.

Second bit in the patch changes one real_parent deref, but leaves 2
others just above it. Once more no bug since the entire thing happens
under tasklist_lock, but the patch should either sort all these cases
or none.

I think it would help if the submitter had shown warnings they see.

-- 
Mateusz Guzik <mjguzik gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
