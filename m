From: sre at kernel.org (Sebastian Reichel)
Date: Mon, 14 Oct 2019 08:58:42 +0200
Subject: [Linux-kernel-mentees] [PATCH 4/4] Driver: Power: Supply:
 abx500_chargalg: Fixed a few coding style errors
In-Reply-To: <20190930082303.GC2036553@kroah.com>
References: <20190929181906.GA21828@madhuparna-HP-Notebook>
	<20190930082303.GC2036553@kroah.com>
Message-ID: <20191014065842.p6kbrl3saeerpoqq@earth.universe>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi,

On Mon, Sep 30, 2019 at 10:23:03AM +0200, Greg KH wrote:
> On Sun, Sep 29, 2019 at 11:49:10PM +0530, Madhuparna Bhowmik wrote:
> > This patch fixes a few coding style errors and warnings
> > detected by checkpatch.pl:
> > 
> > WARNING: please, no space before tabs
> > ERROR: code indent should use tabs where possible
> > WARNING: please, no spaces at the start of a line
> > WARNING: Unnecessary parentheses
> > WARNING: Block comments use a trailing */ on a separate line
> > WARNING: Prefer 'long' over 'long int' as the int is unnecessary
> 
> I know for the subsystems I maintain, I would require this to be broken
> up into "one logical change per patch" so be aware that this might also
> need to be done here too.

Same applies for the power-supply subsystem. Thanks,

-- Sebastian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20191014/ca03ff39/attachment.sig>
