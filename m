From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 30 Sep 2019 10:23:03 +0200
Subject: [Linux-kernel-mentees] [PATCH 4/4] Driver: Power: Supply:
 abx500_chargalg: Fixed a few coding style errors
In-Reply-To: <20190929181906.GA21828@madhuparna-HP-Notebook>
References: <20190929181906.GA21828@madhuparna-HP-Notebook>
Message-ID: <20190930082303.GC2036553@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190930082303.WypcIgONUVhHYSnqQiMb5p5wAB_PhafLxbju1MQZxgY@z>

On Sun, Sep 29, 2019 at 11:49:10PM +0530, Madhuparna Bhowmik wrote:
> This patch fixes a few coding style errors and warnings
> detected by checkpatch.pl:
> 
> WARNING: please, no space before tabs
> ERROR: code indent should use tabs where possible
> WARNING: please, no spaces at the start of a line
> WARNING: Unnecessary parentheses
> WARNING: Block comments use a trailing */ on a separate line
> WARNING: Prefer 'long' over 'long int' as the int is unnecessary

I know for the subsystems I maintain, I would require this to be broken
up into "one logical change per patch" so be aware that this might also
need to be done here too.

good luck!

greg k-h
