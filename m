Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA62CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 11:01:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585BD60FDC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 11:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 585BD60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F20A613DF;
	Fri, 20 Aug 2021 11:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9i4GTtrCztSN; Fri, 20 Aug 2021 11:01:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DFAF260658;
	Fri, 20 Aug 2021 11:01:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAE15C0010;
	Fri, 20 Aug 2021 11:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9410AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 11:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F50B4028A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 11:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.cz header.b="RJ/Hdaoi";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.cz header.b="wjYdJtwh"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QDi3S8RkWWI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 11:01:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57D4B4043F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 11:01:28 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1FB401FE03;
 Fri, 20 Aug 2021 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629457286;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JeRjLjwQhRqYl9HoHzlGb6oujq7wKFT0mdf81J1lNx0=;
 b=RJ/Hdaoib0dDB4d1GdtcW3qfzpK/CLYIfXn/gYFFw/BOqbGEXvVYcw6zb0xJ5WfmrON8lP
 ALPaiXPE1LmXFmvWNDkQG1Gvs3wFZWAAHk3IFkzg+0RPEKaaRRBW3S29EuEoK8dm064LT9
 JYwyXAIZKqBlzMUEwOUWgfzz3/jnfKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629457286;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JeRjLjwQhRqYl9HoHzlGb6oujq7wKFT0mdf81J1lNx0=;
 b=wjYdJtwhWia0lEM7XI7U7xBXdE0VTkqjL1/bBxurEXO9O9dseihR+h9snGQoIB94sWqnNM
 98QpeQF4fI+aUDDA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 0C561A3B8B;
 Fri, 20 Aug 2021 11:01:26 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 5FDECDA730; Fri, 20 Aug 2021 12:58:28 +0200 (CEST)
Date: Fri, 20 Aug 2021 12:58:28 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
Message-ID: <20210820105828.GN5047@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, anand.jain@oracle.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210812103851.GC5047@twin.jikos.cz>
 <3c48eec9-590c-4974-4026-f74cafa5ac48@gmail.com>
 <20210812155032.GL5047@twin.jikos.cz>
 <1e0aafb2-9e55-5f64-d347-1765de0560c5@gmail.com>
 <20210813085137.GQ5047@twin.jikos.cz>
 <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
 <20210813103032.GR5047@twin.jikos.cz>
 <89172356-335f-1ca3-d3a2-78fac7ef93fb@gmail.com>
 <20210819173403.GI5047@twin.jikos.cz>
 <e9c5bb00-b609-aff9-fc95-ca1c5b9c2899@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9c5bb00-b609-aff9-fc95-ca1c5b9c2899@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: linux-kernel@vger.kernel.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com, dsterba@suse.cz,
 anand.jain@oracle.com, josef@toxicpanda.com, clm@fb.com, dsterba@suse.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Aug 20, 2021 at 11:09:05AM +0800, Desmond Cheong Zhi Xi wrote:
> On 20/8/21 1:34 am, David Sterba wrote:
> > On Fri, Aug 20, 2021 at 01:11:58AM +0800, Desmond Cheong Zhi Xi wrote:
> >>>>> The option #2 does not sound safe because the TGT bit is checked in
> >>>>> several places where device list is queried for various reasons, even
> >>>>> without a mounted filesystem.
> >>>>>
> >>>>> Removing the assertion makes more sense but I'm still not convinced that
> >>>>> the this is expected/allowed state of a closed device.
> >>>>>
> >>>>
> >>>> Would it be better if we cleared the REPLACE_TGT bit only when closing
> >>>> the device where device->devid == BTRFS_DEV_REPLACE_DEVID?
> >>>>
> >>>> The first conditional in btrfs_close_one_device assumes that we can come
> >>>> across such a device. If we come across it, we should properly reset it.
> >>>>
> >>>> If other devices has this bit set, the ASSERT will still catch it and
> >>>> let us know something is wrong.
> >>>
> >>> That sounds great.
> >>>
> >>>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> >>>> index 70f94b75f25a..a5afebb78ecf 100644
> >>>> --- a/fs/btrfs/volumes.c
> >>>> +++ b/fs/btrfs/volumes.c
> >>>> @@ -1130,6 +1130,9 @@ static void btrfs_close_one_device(struct btrfs_device *device)
> >>>>                    fs_devices->rw_devices--;
> >>>>            }
> >>>>     
> >>>> +       if (device->devid == BTRFS_DEV_REPLACE_DEVID)
> >>>> +               clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
> >>>> +
> >>>>            if (test_bit(BTRFS_DEV_STATE_MISSING, &device->dev_state))
> >>>>                    fs_devices->missing_devices--;
> >>>
> >>> I'll do a few test rounds, thanks.
> >>
> >> Just following up. Did that resolve the issue or is further
> >> investigation needed?
> > 
> > The fix seems to work, I haven't seen the assertion fail anymore,
> > incidentally the crash also stopped to show up on an unpatched branch.
> > 
> 
> Sounds good, thanks for the update. If there's anything else I can help 
> with, please let me know.

So are you going to send the patch with the fix?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
