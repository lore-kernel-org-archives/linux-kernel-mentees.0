Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B79C3F2C6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 16:54:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A4B20863
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 16:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A4B20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fieldses.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2057E84E5F;
	Tue,  3 Mar 2020 16:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hh-p9sH02l0P; Tue,  3 Mar 2020 16:54:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BED3384C33;
	Tue,  3 Mar 2020 16:54:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B851EC1AE2;
	Tue,  3 Mar 2020 16:54:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66AC7C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54D7C8738A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTKVXPhIsiIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:54:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fieldses.org (fieldses.org [173.255.197.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B500C8733C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:54:39 +0000 (UTC)
Received: by fieldses.org (Postfix, from userid 2815)
 id 1B27D1C22; Tue,  3 Mar 2020 11:54:39 -0500 (EST)
Date: Tue, 3 Mar 2020 11:54:39 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200303165439.GC19140@fieldses.org>
References: <20200213150331.5727-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213150331.5727-1-madhuparnabhowmik10@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: linux-nfs@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 chuck.lever@oracle.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: nfsd: nfs4state.c: Use
	built-in RCU list checking
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

Applying for 5.7, thanks.--b.

On Thu, Feb 13, 2020 at 08:33:31PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> list_for_each_entry_rcu() has built-in RCU and lock checking.
> 
> Pass cond argument to list_for_each_entry_rcu() to silence
> false lockdep warning when  CONFIG_PROVE_RCU_LIST is enabled
> by default.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  fs/nfsd/nfs4state.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 369e574c5092..3a80721fe53d 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -4295,7 +4295,8 @@ find_file_locked(struct knfsd_fh *fh, unsigned int hashval)
>  {
>  	struct nfs4_file *fp;
>  
> -	hlist_for_each_entry_rcu(fp, &file_hashtbl[hashval], fi_hash) {
> +	hlist_for_each_entry_rcu(fp, &file_hashtbl[hashval], fi_hash,
> +				lockdep_is_held(&state_lock)) {
>  		if (fh_match(&fp->fi_fhandle, fh)) {
>  			if (refcount_inc_not_zero(&fp->fi_ref))
>  				return fp;
> -- 
> 2.17.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
