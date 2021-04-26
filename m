Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30286C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:12:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A64E6611BD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64E6611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59EBC83841;
	Mon, 26 Apr 2021 07:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJrnK45YcJKy; Mon, 26 Apr 2021 07:12:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4620C8380B;
	Mon, 26 Apr 2021 07:12:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EF4BC000E;
	Mon, 26 Apr 2021 07:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B570FC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8ECC403B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkP2476SA2ij
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A66E403A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:12:15 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id l19so5251797ilk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJ5pyb6o9I5gG/9qmNTuM5GvBFjd6lzYEIaCMKT0FRg=;
 b=ZoBz5RDew+rReH2NujB0fYJ8jUhHg3Qs7EDdtNtU5/RQ+yD86RAWnQq0M/1Ip4nyGO
 sKToGiZ9XvLTIWVVKAXVyfPxa2w7TYttOIJWDQCTgAGvujP01R9JtJER4EzzME8EFEMm
 7P8TxTtlmohaPqyIEXa7QdV+hK9H4da2WMuqpzA4YnlU4FbEOvqKOofh++E4hyHCc0vC
 aZ9TGFo2quR768mpXEaEkSX5EU3ZjiqJBukLYqmPayXkLqBO60aWwRAHAp6nULgDfn/N
 2GYKX6CerFk01Aoqm30ynNqThgRHEpdR8LJpztuGILzoPnWSZdPdncNCp+q6nvRTzBzC
 IJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJ5pyb6o9I5gG/9qmNTuM5GvBFjd6lzYEIaCMKT0FRg=;
 b=bydzF75AKJuamhLw22uzNnROUW38jmrxk8VxYy36G7ojt5rHxTxDzHl9fOEoJgUN+n
 oM6s2MfN4EBknf7DZRyi8RO88cbDHhALalqM85s8gFRDs92juegW0QWP6zu1EQEIjbsD
 vwY5s7G8ugHyOpMqlSgclLBFwTVufE++GDABWtOfaTY3b9FXoMw94FwhsOHFlwT8dxQn
 Iem5UPzm0YwAg5+R2e2TIiowGJdX2mKByI+FbW3P4irzT109xZH2/Vq3dzB/pExRE0sG
 PZp3DgpkymWlpXNqAbuD/Z3Srwnvdr1zJ9hRZTYdbS/D2Ke4UDzJNewtWHrhSDfl5xaq
 9Y/Q==
X-Gm-Message-State: AOAM5305nf47m3C1PbSBLHprlLZ/7cabuGUGRf7AFD8BeHzgRBpQ7O8e
 Tz9znoqhvYNFWD5QGwKHdrEHk0UmntjT7QURzRU=
X-Google-Smtp-Source: ABdhPJz0FXr+CEReLaJFUW6fP+yZLAti+jXXbdCe7jJEXmEFistSES/0uXjaO+HVECaKBNCj0yCWbE1V3bxIqkit/h4=
X-Received: by 2002:a05:6e02:1c83:: with SMTP id
 w3mr12720982ill.125.1619421134317; 
 Mon, 26 Apr 2021 00:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR02MB631763A2B44549BBC9A8939DA5479@MN2PR02MB6317.namprd02.prod.outlook.com>
In-Reply-To: <MN2PR02MB631763A2B44549BBC9A8939DA5479@MN2PR02MB6317.namprd02.prod.outlook.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 26 Apr 2021 09:12:03 +0200
Message-ID: <CAKXUXMxJRthAWVsDR+m7OsJ_2O0UMv7SOLoAPE=spgSGZ741Eg@mail.gmail.com>
Subject: Re: LFX Mentorship summer intership
To: "Wang, Haizhou" <hjw5074@psu.edu>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Haizhou,

please register on the LFX mentorship site
(https://mentorship.lfx.linuxfoundation.org/project/8f69e012-08d0-4e2b-baa7-9143b5f98823)
for this project and provide all required information there.

Then subscribe to the linux-kernel-mentees mailing list (see CC), our
main channel for communication, and send an email with the following
subject and message in plain-text (not HTML):

subject: [Mining for Maintainers] Interest in Mentorship: <your name>
message:

Lukas, I am interested in the mentorship Mining for Maintainers.
Please provide me with the required technical tasks for the mentee
selection.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
