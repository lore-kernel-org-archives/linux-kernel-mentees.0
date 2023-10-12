Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726F5CDB47E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 11:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEB63405FA;
	Thu, 12 Oct 2023 11:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB63405FA
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=S6J2Idyb;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VzzqB1SO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zC4QdTyPAZCV; Thu, 12 Oct 2023 11:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 448924013F;
	Thu, 12 Oct 2023 11:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 448924013F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1642BC0071;
	Thu, 12 Oct 2023 11:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E56B1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95A3400E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B95A3400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qL78czZGtAjW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:54:37 +0000 (UTC)
X-Greylist: delayed 514 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 12 Oct 2023 11:54:37 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C0C4013F
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02C0C4013F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:54:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42F381F74B;
 Thu, 12 Oct 2023 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697111159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/WwHXjrDg4jdiJkldLYA2TZp2IOGl3eZCDe75dEDcsk=;
 b=S6J2Idyb6pdPOuPwXmMVJ4h4N6ClfPoFr9tHeHZOSdYb+m0Nbmv91fMyqiIAjnEYYPU6E/
 Rq3BK1pD+r7IoIobRxmgwFg4WQFM8woI1LwjKQ7YUdQ5OzRw/sJSLjcxxgEEAybDNSM29u
 hLHcHhVzI+MrkKux8PpILUokP9wXIl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697111159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/WwHXjrDg4jdiJkldLYA2TZp2IOGl3eZCDe75dEDcsk=;
 b=VzzqB1SODnHecSJPJZLDb7nZEJtV8BQuokY8rB5hvVymirMuLp3CbJMS8IStIHhjengO7j
 9pPk495Ckr1iCmDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 359F3139ED;
 Thu, 12 Oct 2023 11:45:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qUwTDXfcJ2WjOgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 12 Oct 2023 11:45:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B5417A06B0; Thu, 12 Oct 2023 13:45:58 +0200 (CEST)
Date: Thu, 12 Oct 2023 13:45:58 +0200
From: Jan Kara <jack@suse.cz>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH] fs/minix: Improve validity checking of superblock
Message-ID: <20231012114558.ikpxqs7zleq6tvri@quack3>
References: <VI1P193MB0752662A4587C90C3DD4C5DB99D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB0752662A4587C90C3DD4C5DB99D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-9.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[outlook.com];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 TAGGED_RCPT(0.00)[2f142b57f2af27974fda,5ad0824204c7bf9b67f2];
 MIME_GOOD(-0.10)[text/plain]; REPLY(-4.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_TO(0.00)[outlook.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
Cc: brauner@kernel.org, jack@suse.cz, jlayton@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+2f142b57f2af27974fda@syzkaller.appspotmail.com,
 syzbot+5ad0824204c7bf9b67f2@syzkaller.appspotmail.com, xiubli@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu 12-10-23 19:07:22, Juntong Deng wrote:
> According to the Minix source code, s_imap_blocks, s_zmap_blocks,
> s_ninodes, s_zones, s_firstdatazone, and s_log_zone_size should
> be checked for validity when reading superblocks.
> 
> The following is the content of minix/fs/mfs/super.c:332
> 
>   /* Make a few basic checks to see if super block looks reasonable. */
>   if (sp->s_imap_blocks < 1 || sp->s_zmap_blocks < 1
> 				|| sp->s_ninodes < 1 || sp->s_zones < 1
> 				|| sp->s_firstdatazone <= 4
> 				|| sp->s_firstdatazone >= sp->s_zones
> 				|| (unsigned) sp->s_log_zone_size > 4) {
> 	printf("not enough imap or zone map blocks, \n");
> 	printf("or not enough inodes, or not enough zones, \n"
> 		"or invalid first data zone, or zone size too large\n");
> 	return(EINVAL);
>   }
> 
> This patch improve the validity checking of superblock based on the
> Minix source code above.
> 
> Since the validity of s_log_zone_size is not currently checked,
> this can lead to errors when s_log_zone_size is subsequently used
> as a shift exponent.
> 
> The following are related bugs reported by Syzbot:
> 
> UBSAN: shift-out-of-bounds in fs/minix/bitmap.c:103:3
> shift exponent 34 is too large for 32-bit type 'unsigned int'
> 
> UBSAN: shift-out-of-bounds in fs/minix/inode.c:380:57
> shift exponent 65510 is too large for 64-bit type 'long unsigned int'
> 
> Reported-by: syzbot+2f142b57f2af27974fda@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2f142b57f2af27974fda
> Reported-by: syzbot+5ad0824204c7bf9b67f2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5ad0824204c7bf9b67f2
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
...
> diff --git a/fs/minix/inode.c b/fs/minix/inode.c
> index df575473c1cc..84c2c6e77d1d 100644
> --- a/fs/minix/inode.c
> +++ b/fs/minix/inode.c
> @@ -154,7 +154,11 @@ static bool minix_check_superblock(struct super_block *sb)
>  {
>  	struct minix_sb_info *sbi = minix_sb(sb);
>  
> -	if (sbi->s_imap_blocks == 0 || sbi->s_zmap_blocks == 0)
> +	if (sbi->s_imap_blocks < 1 || sbi->s_zmap_blocks < 1 ||
> +		sbi->s_ninodes < 1 || sbi->s_nzones < 1 ||
> +		sbi->s_firstdatazone <= 4 ||
> +		sbi->s_firstdatazone >= sbi->s_nzones ||
> +		sbi->s_log_zone_size > 4)

Nit: The indentation we use for long conditions is:
	if (sbi->s_imap_blocks < 1 || sbi->s_zmap_blocks < 1 ||
	    sbi->s_ninodes < 1 || sbi->s_nzones < 1 ||
	    sbi->s_firstdatazone <= 4 ||
	    sbi->s_firstdatazone >= sbi->s_nzones || sbi->s_log_zone_size > 4)

Also based on http://ohm.hgesser.de/sp-ss2012/Intro-MinixFS.pdf I think
s_firstdatazone is constrained even more (since there must be inode bitmap,
zone bitmap, and inode table before it).

Also s_log_zone_size is odd. Looking at how it is treated within the code
it only matters for reporting of free blocks (but zone bitmap is really
treated as having one bit per block) so I don't think we really support
anything else than 0 there but that would need confirmation by someone more
knowledgeable with the code.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
