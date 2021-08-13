Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D373C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0299C60EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0299C60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B872780E8B;
	Fri, 13 Aug 2021 10:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meOAVdzN_fIv; Fri, 13 Aug 2021 10:33:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8427083638;
	Fri, 13 Aug 2021 10:33:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A967C001A;
	Fri, 13 Aug 2021 10:33:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDE6AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFDCA83AA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRQ8w6mWa3KV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:33:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8830483638
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:33:29 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EDD4F201B2;
 Fri, 13 Aug 2021 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628850806;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=THaFvJ0mMbfDh3kdowKax6bW6A4Pv8w9QwsEiqD14UI=;
 b=1lCDKFU5NzKjrckU12DycGARob7wjYTUQRJnEcmQbXa+uNz1PDy+dg5JZXjsCNQl2B3ET6
 q6G1J+sd2kWCoS9+3LSqZ3vpcXzPd4yWYx1LEQnI6NKie4un45Odrkbg2jTBbafs0MVWvW
 dofC/Xvs5vjDdKgYEs05zGOvGvb+4Vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628850806;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=THaFvJ0mMbfDh3kdowKax6bW6A4Pv8w9QwsEiqD14UI=;
 b=9x9HZVG+Iu2H2NF5yuSqyumy5ZIO8zBpSeb150vsVzVEHMbNnfR4FSTS8UgoS5kggkzFx+
 xTIv/3oBOWJt4yAA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id D9FA5A3B84;
 Fri, 13 Aug 2021 10:33:26 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id DBCD1DB25F; Fri, 13 Aug 2021 12:30:32 +0200 (CEST)
Date: Fri, 13 Aug 2021 12:30:32 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
Message-ID: <20210813103032.GR5047@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, anand.jain@oracle.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210727071303.113876-1-desmondcheongzx@gmail.com>
 <20210812103851.GC5047@twin.jikos.cz>
 <3c48eec9-590c-4974-4026-f74cafa5ac48@gmail.com>
 <20210812155032.GL5047@twin.jikos.cz>
 <1e0aafb2-9e55-5f64-d347-1765de0560c5@gmail.com>
 <20210813085137.GQ5047@twin.jikos.cz>
 <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
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

On Fri, Aug 13, 2021 at 05:57:26PM +0800, Desmond Cheong Zhi Xi wrote:
> On 13/8/21 4:51 pm, David Sterba wrote:
> > On Fri, Aug 13, 2021 at 01:31:25AM +0800, Desmond Cheong Zhi Xi wrote:
> >> On 12/8/21 11:50 pm, David Sterba wrote:
> >>> On Thu, Aug 12, 2021 at 11:43:16PM +0800, Desmond Cheong Zhi Xi wrote:
> >>>> On 12/8/21 6:38 pm, David Sterba wrote:
> >>>>> On Tue, Jul 27, 2021 at 03:13:03PM +0800, Desmond Cheong Zhi Xi wrote:
> >>>>>> --- a/fs/btrfs/volumes.c
> >>>>>> +++ b/fs/btrfs/volumes.c
> >>>>>> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
> >>>>>>     		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
> >>>>>>     			list_del_init(&device->dev_alloc_list);
> >>>>>>     			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
> >>>>>> +			fs_devices->rw_devices--;
> >>>>>>     		}
> >>>>>>     		list_del_init(&device->dev_list);
> >>>>>>     		fs_devices->num_devices--;
> >>>>>
> >>>>> I've hit a crash on master branch with stacktrace very similar to one
> >>>>> this bug was supposed to fix. It's a failed assertion on device close.
> >>>>> This patch was the last one to touch it and it matches some of the
> >>>>> keywords, namely the BTRFS_DEV_STATE_REPLACE_TGT bit that used to be in
> >>>>> the original patch but was not reinstated in your fix.
> >>>>>
> >>>>> I'm not sure how reproducible it is, right now I have only one instance
> >>>>> and am hunting another strange problem. They could be related.
> >>>>>
> >>>>> assertion failed: !test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state), in fs/btrfs/volumes.c:1150
> >>>>>
> >>>>> https://susepaste.org/view/raw/18223056 full log with other stacktraces,
> >>>>> possibly relatedg
> >>>>>
> >>>>
> >>>> Looking at the logs, it seems that a dev_replace was started, then
> >>>> suspended. But it wasn't canceled or resumed before the fs devices were
> >>>> closed.
> >>>>
> >>>> I'll investigate further, just throwing some observations out there.
> >>>
> >>> Thanks. I'm testing the patch revert, no crash after first loop, I'll
> >>> run a few more to be sure as it's not entirely reliable.
> >>>
> >>> Sending the revert is option of last resort as we're approaching end of
> >>> 5.14 dev cycle and the crash prevents testing (unlike the fuzzer
> >>> warning).
> >>>
> >>
> >> I might be missing something, so any thoughts would be appreciated. But
> >> I don't think the assertion in btrfs_close_one_device is correct.
> >>
> >>   From what I see, this crash happens when close_ctree is called while a
> >> dev_replace hasn't completed. In close_ctree, we suspend the
> >> dev_replace, but keep the replace target around so that we can resume
> >> the dev_replace procedure when we mount the root again. This is the call
> >> trace:
> >>
> >>     close_ctree():
> >>       btrfs_dev_replace_suspend_for_unmount();
> >>       btrfs_close_devices():
> >>         btrfs_close_fs_devices():
> >>           btrfs_close_one_device():
> >>             ASSERT(!test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
> >> &device->dev_state));
> >>
> >> However, since the replace target sticks around, there is a device with
> >> BTRFS_DEV_STATE_REPLACE_TGT set, and we fail the assertion in
> >> btrfs_close_one_device.
> >>
> >> Two options I can think of:
> >>
> >> - We could remove the assertion.
> >>
> >> - Or we could clear the BTRFS_DEV_STATE_REPLACE_TGT bit in
> >> btrfs_dev_replace_suspend_for_unmount. This is fine since the bit is set
> >> again in btrfs_init_dev_replace if the dev_replace->replace_state is
> >> BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED. But this approach strikes me as
> >> a little odd because the device is still the replace target when
> >> mounting in the future.
> > 
> > The option #2 does not sound safe because the TGT bit is checked in
> > several places where device list is queried for various reasons, even
> > without a mounted filesystem.
> > 
> > Removing the assertion makes more sense but I'm still not convinced that
> > the this is expected/allowed state of a closed device.
> > 
> 
> Would it be better if we cleared the REPLACE_TGT bit only when closing
> the device where device->devid == BTRFS_DEV_REPLACE_DEVID?
> 
> The first conditional in btrfs_close_one_device assumes that we can come
> across such a device. If we come across it, we should properly reset it.
> 
> If other devices has this bit set, the ASSERT will still catch it and
> let us know something is wrong.

That sounds great.

> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 70f94b75f25a..a5afebb78ecf 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -1130,6 +1130,9 @@ static void btrfs_close_one_device(struct btrfs_device *device)
>                  fs_devices->rw_devices--;
>          }
>   
> +       if (device->devid == BTRFS_DEV_REPLACE_DEVID)
> +               clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
> +
>          if (test_bit(BTRFS_DEV_STATE_MISSING, &device->dev_state))
>                  fs_devices->missing_devices--;

I'll do a few test rounds, thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
