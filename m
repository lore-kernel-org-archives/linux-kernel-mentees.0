Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB32AC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:37:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DFE8208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aafhezfw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DFE8208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C8B7862A5;
	Mon, 14 Sep 2020 18:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jri7XwPqBOsy; Mon, 14 Sep 2020 18:37:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7532785DEC;
	Mon, 14 Sep 2020 18:37:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B75FC0859;
	Mon, 14 Sep 2020 18:37:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA52C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D03B87151
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IlyTNmmxos2M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:37:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC13F8711E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:37:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c196so345152pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 11:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cIjnkNboqpSpjKpr5bq8lUzIhrcoSiXnXhmqYN4ei3c=;
 b=AafhezfwbH68K+RdqYxFPc1vR/a0IPjGkG+E9FLkVV/sAW8WWA2tWv2LkHWbhH54eg
 aT6l3xw3ZSGubZ4Vn8U7NMCoaxBLUe+a7WDwDsTjTDF3Z70v2/SJWfdcAC16TIzj6w98
 ssZ9YuPz7yaoVBPrzIsIOWSZt4Ua+hYjFqeWwSEUgVD3003lc0zQsOiN2WFufdp7OxMj
 S5ieMvoGp5u17M4Kr6xdPhx6qOItpgoYPviJq5c97rdWid5GiQoOqMgHrTHJJaxpr7yk
 khD2PorC+YRbeBtFTB172VG91hPad9ue00nFRfrgBhEkGxKV+ZbjUcPNnmorQZf0Iwuq
 4q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cIjnkNboqpSpjKpr5bq8lUzIhrcoSiXnXhmqYN4ei3c=;
 b=DFUuezNPin9QSlfzzleV1aahD8nIfg1kQQgZifhkxmESVzxzjwqK5C/jx8G45JI/rd
 BFzjqOM9l35IIfO5U4KywcvH0uef4TtYW0Y893FLIz/MVVxlbupceYM+MzvdZzSKlfmW
 E/7RcMEPBRD3klwBarBz5teuYTDxzw+PHP3zVrcdpZto/d9ju5oQvNqBaJzmOXCkEFvT
 IxsQX9DadDPm+fx6YXVe2XrwVg8KZ+cHzP5SLqhd7+1xQEkB6thEjRtfkCHd1iDr8eTD
 TVWddkH25UKnZWT8wdEh5+zmHnK8W787gE6rT4XCtLaTkJmYF6nQ/Ff9RVDYIXink5Nv
 q1cA==
X-Gm-Message-State: AOAM530NBHnU7tR3PFc6UjEE5Xxofq0vCzYvUBzlqCJDhAmOFATH7iKR
 mKsIkIIicHqcAF586SAmSCc=
X-Google-Smtp-Source: ABdhPJxd+HIKMi83DPmS+Gm/5/k9uEYuw6a1koLz6/IjZhZtYPnN26smI7fZ5TQp37DTMyGAWcSAQg==
X-Received: by 2002:a62:864e:: with SMTP id x75mr14212709pfd.60.1600108662974; 
 Mon, 14 Sep 2020 11:37:42 -0700 (PDT)
Received: from Thinkpad ([45.118.167.207])
 by smtp.gmail.com with ESMTPSA id r144sm11769496pfc.63.2020.09.14.11.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:37:42 -0700 (PDT)
Date: Tue, 15 Sep 2020 00:07:34 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200914183734.GA213347@Thinkpad>
References: <20200910043424.19894-1-anmol.karan123@gmail.com>
 <20200910104918.GF12635@kadam> <20200912091028.GA67109@Thinkpad>
 <20200914154405.GC18329@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914154405.GC18329@kadam>
Cc: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 johan.hedberg@gmail.com, netdev@vger.kernel.org, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
 dereference in hci_event_packet()
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

Hello Sir,
 
> > I have looked into the Bisected logs and the problem occurs from this commit:
> > 
> > 941992d29447 ("ethernet: amd: use IS_ENABLED() instead of checking for built-in or module")
> > 
> 
> That's just the patch which made the code testable by syzbot.  It didn't
> introduce the bug.
> 
> > 
> > Here is a diff of patch which i modified from last patch,
> > 
> > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > index 4b7fc430793c..6ce435064e0b 100644
> > --- a/net/bluetooth/hci_event.c
> > +++ b/net/bluetooth/hci_event.c
> > @@ -4936,6 +4936,12 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
> >                 return;
> >         }
> > 
> > +       if (!hcon->amp_mgr) {
> > +               hci_conn_del(hcon);
> > +               hci_dev_unlock(hdev);
> 
> I have no idea if calling hci_conn_del() is really the correct, thing.
> I don't know the code at all.  Anyway, do some research and figure out
> for sure what the correct thing is.

I have created my patch on the basis of the already applied conditions handling
in this function, i.e whenever NULL dereference occurs, connection cleanup is 
required hence, hci_conn_del() is used here. Will see if anything else could be
done.

> 
> Also look for similar bugs in other places where hcon->amp_mgr is
> dereferenced.  For example, amp_read_loc_assoc_final_data() seems to
> have a similar bug.
> 

Sure sir will look into it.

> regards,
> dan carpenter
> 

Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
