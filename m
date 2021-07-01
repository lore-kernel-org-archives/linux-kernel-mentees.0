Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D33C11F6B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 21:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635AF61402
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 21:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635AF61402
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223C760A51;
	Thu,  1 Jul 2021 21:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwsY3MpURWP6; Thu,  1 Jul 2021 21:06:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 342906065A;
	Thu,  1 Jul 2021 21:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA7EC0010;
	Thu,  1 Jul 2021 21:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 414AEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D71383D08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpTWDbPmAy44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 21:06:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BE0B83D02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 21:06:50 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id f13so5158971qtb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JdZfhD8zS8Li7V1IWr5im/Ov0yGZJzdw3SFKa8tmvaA=;
 b=coFXzdn8+GFRVvzHgAyl5ya90JjlYSnS84Ena2i664mPYGWza2mLyEi8CqvbBO8QoK
 AMKqkrmx7AB/snglYTmG5VrGh4KFMVa7MmrarR+R6xWquwmAObVhKQrwP0YBpq0OWeXZ
 ffUGNPzJd2Q0pR2qmS8V2U7qHuxJPArIgljtleqjf3PwLu85WorQ4hrTVQoQLOCZ2fwb
 zk4mMVfXrcghfDxud6b6JG16Psnajj/rrjufSzS+N1gtQT6TfXL6qfak/ryp5/D0kWmv
 FB23x9kxBbkg4Gmi16pIJJ5sNRXbfXSlqkeMVKEeD9YZLh0MnFAwgshvw+7RY6IdV8Mt
 1wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JdZfhD8zS8Li7V1IWr5im/Ov0yGZJzdw3SFKa8tmvaA=;
 b=tykdzk4qcHqhJOuoIhLv95f8L4p9OmgMk0cW1r1b7rSWuRUoPP0kY7Qaf29Ubw9ago
 tCN5WOpRGWlLn52dXR0mkXsZCMalwXA3qWjrUpMhtrKWdMup8TJvDQ48I51VeLGekHwh
 iSehlSAHXy2vC5lKGrNUZXO3DzmWZBLgih3e2ctM1VwRcUdPvVDPxRCI7LubqPkW0FH7
 Ysaj97RAzMpK0aPQabg5GcY8h3ttV+5+wRFRFnIkLPD2AEnXrHYVJiiQWvAwJpq2mSv3
 RM0P2eY3jfucQvyYtmhowkyyLMAeo82dVnCOURuMs8DNz/DtWcQCksWMpyvfFa5fO5bn
 pIQg==
X-Gm-Message-State: AOAM530bcxHMsimI3kCdwbFONH9O2qlfI4jU6OnVcxCGfjLEyGP15xGV
 aKG9opMuSitiB2DTw0JP+Q==
X-Google-Smtp-Source: ABdhPJzJZm7Wwvj9JL2Rw3TI6kf2fUOVVJh1b0RQieFYgctpFerkJ6QWAsaYSREJxI0H7Uuwi4ovZg==
X-Received: by 2002:a05:622a:453:: with SMTP id
 o19mr1903676qtx.122.1625173609396; 
 Thu, 01 Jul 2021 14:06:49 -0700 (PDT)
Received: from PWN (104-9-124-193.lightspeed.sntcca.sbcglobal.net.
 [104.9.124.193])
 by smtp.gmail.com with ESMTPSA id t62sm431440qkc.26.2021.07.01.14.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:06:49 -0700 (PDT)
Date: Thu, 1 Jul 2021 17:06:45 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Alexander Larkin <avlarkin82@gmail.com>
Subject: Re: maybe similar bug exists for HCI_EV_INQUIRY_RESULT* like
 [Linux-kernel-mentees] [PATCH v2] net/bluetooth: slab-out-of-bounds read in
 hci_extended_inquiry_result_evt()
Message-ID: <20210701210645.GA14471@PWN>
References: <20200709130224.214204-1-yepeilin.cs@gmail.com>
 <20210701153936.2954886-1-avlarkin82@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701153936.2954886-1-avlarkin82@gmail.com>
Cc: johan.hedberg@gmail.com, netdev@vger.kernel.org, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Thu, Jul 01, 2021 at 06:39:36PM +0300, Alexander Larkin wrote:
> For the net/bluetooth/hci_event.c , maybe similar bug could be inside
> hci_inquiry_result_with_rssi_evt() that is HCI_EV_INQUIRY_RESULT_WITH_RSSI
> and inside hci_inquiry_result_evt() that is HCI_EV_INQUIRY_RESULT. 

Hi Alexander,

Thanks for looking into this, I believe they were handled in commit
629b49c848ee ("Bluetooth: Prevent out-of-bounds read in
hci_inquiry_result_with_rssi_evt()") and commit 75bbd2ea50ba ("Bluetooth:
Prevent out-of-bounds read in hci_inquiry_result_evt()").

Thanks,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
