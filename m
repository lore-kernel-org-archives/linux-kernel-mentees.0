Return-Path: <SRS0=ugj7=IB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C6BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 23:42:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F65B60C41
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 23:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F65B60C41
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1060F40196;
	Wed,  3 Mar 2021 23:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WXVkxddzJ81; Wed,  3 Mar 2021 23:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC45340185;
	Wed,  3 Mar 2021 23:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9D39C000A;
	Wed,  3 Mar 2021 23:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E9B7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 23:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07DA984342
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 23:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlIJZwUYmccK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 23:42:52 +0000 (UTC)
X-Greylist: delayed 12:27:29 by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 259C48433E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 23:42:51 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id l4so11218173qkl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Mar 2021 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u4NW6pVd55BVysXdGT9j2mN9N0jqN4OssY4y20JP5Tk=;
 b=fkd/r7Nk6TKGUmo21/5ScKGNyY1XZVKDnKh3WzZ5MGyaqRpNGTDS0zz71/2IGFs7+A
 j2RNv6QW821we60GeAaBAzInbkCNC7BnQd6E56vS0I+S47CHqX9vxSyMZQfZNgRHDSTi
 cVL3jknZrlyBDjsDrmeV/kYmXS++qxWtJD0VuiTK0Mu8gS4hUyczmBHYNDzKgB1pMgzW
 beLPBoxPckYpBHn7/BecxYr6EHkRNFdSatH5YHmRM0CQslemaboAxMbefrFm7ZfOxbvY
 MYoyzRW/PEaoJJ1yjlpHZ5dqyclt1JsNj/VCSBRQjyYTFvaiiIbH6CbrpKrGcJqkLGUy
 NINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4NW6pVd55BVysXdGT9j2mN9N0jqN4OssY4y20JP5Tk=;
 b=eTZyLJ3j+YCUvOMruYpQTZxhr6RwIXQi6AJ8CeU+kkPrv/NR1FhzF8qQ3OK2+rkgbI
 tM70b0c63EvpBxec1c7D64C7y/SK3WyUT867vg+AeXYvJgZaZSy8xH7KAYCmTY2LLfH5
 lga+BRa3Fxl9Y5k5JGIUhxA2U37NrGOWovlnzZYYVxTWCdWc4KSAzhi3nsn9RlsE29/n
 K7PCQEkDfd3MttvLLbiKIgbapl0okLOq7IvcUqo/AP9iB/m34JGpMlO7ksIGwfTyJY+M
 y+vLQBKycWx7eewbp/lnBIzsRh5pETZR0LqQtM9Cnif8KWQY+ev+NU1QxajEYsKt3HDF
 t30g==
X-Gm-Message-State: AOAM531V9BShnM8atobZru8etkz1l5r0E4TzRkUq8zmT8QCdWXpfYA6G
 mE5A8nWD1ysFLCvKlj+5uthB6uGhllqhlTlLlvzZJae/G27eMA==
X-Google-Smtp-Source: ABdhPJzr/7vquNM3mrxZ3jm9E4gx993nP272v7aKwR6SRzfJgdcxWsvvzwwDgwU0bG514ImSii708d0CzyhXNZVQE+I=
X-Received: by 2002:a05:622a:c9:: with SMTP id
 p9mr21103012qtw.337.1614759712453; 
 Wed, 03 Mar 2021 00:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20200808040440.255578-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200808040440.255578-1-yepeilin.cs@gmail.com>
Date: Wed, 3 Mar 2021 09:21:41 +0100
Message-ID: <CACT4Y+b6m7kRS82iRNcmaEPKN8fbvOUmztuGJSw6OketyxM8Kw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer
 dereference in amp_read_loc_assoc_final_data()
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Andrei Emeltchenko <andrei.emeltchenko@intel.com>, gtiwari@redhat.com,
 Marcel Holtmann <marcel@holtmann.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 8, 2020 at 6:06 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Prevent amp_read_loc_assoc_final_data() from dereferencing `mgr` as NULL.
>
> Reported-and-tested-by: syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
> Fixes: 9495b2ee757f ("Bluetooth: AMP: Process Chan Selected event")
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  net/bluetooth/amp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
> index 9c711f0dfae3..be2d469d6369 100644
> --- a/net/bluetooth/amp.c
> +++ b/net/bluetooth/amp.c
> @@ -297,6 +297,9 @@ void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
>         struct hci_request req;
>         int err;
>
> +       if (!mgr)
> +               return;
> +
>         cp.phy_handle = hcon->handle;
>         cp.len_so_far = cpu_to_le16(0);
>         cp.max_len = cpu_to_le16(hdev->amp_assoc_size);

Not sure what happened here, but the merged patch somehow has a
different author and no Reported-by tag:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8bd76ede155fd54d8c41d045dda43cd3174d506
so let's tell syzbot what fixed it manually:
#syz fix:
Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
